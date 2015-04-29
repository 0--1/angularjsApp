'use strict';

angular.module('myApp').service('RouteFilter', ['$state', function ($state) {
	var filters = {},
		addFilter = function(route, name, message, callback, redirectRoute) {
			filters[route] = filters[route] || [];
			filters[route].push({
				name: name,
				message: message,
				callback: callback,
				redirectRoute: redirectRoute || false
			});
		};

	this.canAccess = function(route) {
		if(!filters[route]) {
			return true;
		}

		return filters[route].every(function(filter) {
			return filter.callback();
		});
	};

	this.register = function(routes, name, message, callback, redirectRoute) {
		var i;

		if(typeof callback === 'undefined') {
			return;
		}

		if(angular.isArray(routes)) {
			for(i = 0; i < routes.length; i++) {
				addFilter(routes[i], name, message, callback, redirectRoute);
			}
		} else {
			addFilter(routes, name, message, callback, redirectRoute);
		}
	};

	this.run = function(route, event) {
		if(!filters[route]) {
			return true;
		}

		filters[route].every(function(filter) {
			if(!filter.callback()) {
				event.preventDefault();
				console.warn(filter.message);
				if(filter.redirectRoute) {
					$state.go(filter.redirectRoute);
				}
			}
			return true;
		});
	};
}]);
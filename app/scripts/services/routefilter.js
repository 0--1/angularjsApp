'use strict';

angular.module('myApp').service('RouteFilter', ['$state', function ($state) {
	var filters = [],
		getFilter = function(route) {
			var i, j;

			for(i = 0; i < filters.length; i++) {
				for(j = 0; j < filters[i].routes.length; j++) {
					if(filters[i].routes[j] === route) {
						return filters[i];
					}
				}
			}

			return false;
		};

	this.canAccess = function(route) {
		var filter = getFilter(route);

		return filter.callback();
	};

	this.register = function(name, routes, callback, redirectRoute) {
		redirectRoute = redirectRoute || false;

		filters.push({
			name: name,
			routes: routes,
			callback: callback,
			redirectRoute: redirectRoute
		});
	};

	this.run = function(route, event) {
		var filter = getFilter(route);

		if(!!filter && !filter.callback()) {
			event.preventDefault();
			if(!!filter.redirectRoute) {
				$state.go(filter.redirectRoute);
			}
		}
	};
}]);
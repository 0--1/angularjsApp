'use strict';

angular.module('myApp').service('Application', ['$state', function ($state) {
	var ready = false,
		authenticated = false,
		listeners = [],
		callListeners = function() {
			var i;

			for(i = 0; i < listeners.length; i++) {
				listeners[i]();
			}
		};

	this.isReady = function() {
		return ready;
	};

	this.makeReady = function() {
		ready = true;

		callListeners();
	};

	this.isAuthenticated = function() {
		return authenticated;
	};

	this.setAuthenticated = function(value) {
		authenticated = !!value;
		if(!value) {
			$state.go('loading');
		}
	};

	this.registerListener = function(callback) {
		if(ready) {
			callback();
		} else {
			listeners.push(callback);
		}
	};
}]);
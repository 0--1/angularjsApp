'use strict';

angular.module('myApp').service('Application', ['$state', function ($state) {
	var ready = false,
		authenticated = false,
		listeners = [],
		callListeners = function() {
			while(listeners.length > 0) {
				listeners.shift()();
			}
		};

	this.isReady = function() {
		return ready;
	};

	this.makeReady = function() {
		ready = true;
	};

	this.isAuthenticated = function() {
		return authenticated;
	};

	this.setAuthenticated = function(authStatus) {
		authenticated = !!authStatus;
		
		if(authStatus) {
			callListeners();
		} else {
			$state.go('loading');
		}
	};

	this.registerListener = function(callback) {
		if(authenticated) {
			callback();
		} else {
			listeners.push(callback);
		}
	};
}]);
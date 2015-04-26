'use strict';

angular.module('myApp').service('Application', [function () {
	var ready = false,
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

	this.registerListener = function(callback) {
		if(ready) {
			callback();
		} else {
			listeners.push(callback);
		}
	};
}]);
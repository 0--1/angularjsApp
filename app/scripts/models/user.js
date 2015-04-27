'use strict';

angular.module('myApp').service('UserModel', ['SERVER', 'APIS', 'Resource', function(SERVER, APIS, Resource) {
	angular.extend(this, new Resource(SERVER.dev + APIS.root + APIS.user));
	var currentUser = false;

	this.getUser = function(userId, isCurrentUser) {
		return this.get('', {userId: userId}).then(function(response) {
			if(isCurrentUser) {
				currentUser = response;
			}
			return response;
		}, this.sendError);
	};

	this.getCurrentUser = function() {
		return currentUser;
	};

	this.removeCurrentUser = function() {
		currentUser = false;
	};
}]);

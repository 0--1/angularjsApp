'use strict';

angular.module('myApp').service('UserModel', ['SERVER', 'CONFIG', 'Resource', function(SERVER, CONFIG, Resource) {
	angular.extend(this, new Resource(SERVER.dev + CONFIG.api.root + CONFIG.api.user));

	this.getUser = function(userId) {
		return this.get('', {userId: userId}).then(this.sendResponse, this.sendError);
	};
}]);

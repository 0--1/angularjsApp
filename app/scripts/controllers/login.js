'use strict';

angular.module('myApp')
	.controller('LoginCtrl', function ($scope, SERVER, CONFIG, Resource, $http, $cookies, UserModel, AuthModel) {
		AuthModel.login('behroozkamali@yahoo.com', 'kamali');
		UserModel.getUser(20).then(function(user) {console.log(user);});
	});

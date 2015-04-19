'use strict';

angular.module('myApp')
.controller('NavbarCtrl', ['$scope', 'AuthModel', function ($scope, AuthModel) {
	var init = function() {};

	$scope.signOut = function() {
		AuthModel.signOut();
	};

	init();
}]);

'use strict';

angular.module('myApp')
.controller('NavbarCtrl', ['$scope', 'AuthModel', '$mdSidenav', function ($scope, AuthModel, $mdSidenav) {
	var init = function() {};

	$scope.signOut = function() {
		AuthModel.signOut();
	};

	$scope.openLeftMenu = function() {
    $mdSidenav('left').toggle();
  };

	init();
}]);

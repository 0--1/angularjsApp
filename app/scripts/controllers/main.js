'use strict';

angular.module('myApp')
.controller('MainCtrl', ['$scope', 'EVENTS', 'Application', 'UserModel', '$log', function ($scope, EVENTS, Application, UserModel, $log) {
	var init = function() {
		$scope.currentUser = false;
		$scope.$log = $log;
	};

	$scope.isAuthenticated = function() {
		return Application.isAuthenticated();
	};

	$scope.isReady = function() {
		return Application.isReady();
	};

	$scope.setUser = function(user) {
		$scope.currentUser = user;
	};

	init();

	$scope.$on(EVENTS.signOut, function() {
		UserModel.removeCurrentUser();
		$scope.setUser(false);
		Application.setAuthenticated(false);
	});
	// AuthModel.login('behroozkamali@yahoo.com', 'kamali');
}]);

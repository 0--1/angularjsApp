'use strict';

angular.module('myApp')
.controller('LoadingCtrl', ['$scope', '$state', 'UserModel', '$cookies', 'Application',
function ($scope, $state, UserModel, $cookies, Application) {
	var init = function() {
		Application.makeReady();
		if($cookies.uid) {
			UserModel.getUser($cookies.uid, true).then(function(user) {
				if(user.error) {
					Application.setAuthenticated(false);
					$state.go('login');
				} else {
					$scope.setUser(user);
					Application.setAuthenticated(true);
					$state.go('home');
				}
			});
		} else {
			$state.go('login');
		}
	};

	init();
}]);
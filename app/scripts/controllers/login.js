'use strict';

angular.module('myApp')
	.controller('LoginCtrl', ['$scope', '$state', 'AuthModel', 'Application', 'UserModel', function ($scope, $state, AuthModel, Application, UserModel) {
		var init = function() {
			$scope.signingIn = false;
		};

		$scope.signin = function() {
			$scope.signingIn = true;
			AuthModel.signIn($scope.email, $scope.pass).then(function(response) {
				if(response.code === '401') {
					$scope.signingIn = false;
				} else {
					UserModel.getUser(response.uid, true).then(function(user) {
						$scope.setUser(user);
						Application.setAuthenticated(true);
						$state.go('home');
					});
				}
			});
		};

		$scope.cancelSignin = function() {
			$scope.signingIn = false;
		};

		init();
	}]);

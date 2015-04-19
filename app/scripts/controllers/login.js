'use strict';

angular.module('loginApp', [
	'ngAnimate',
	'ngCookies',
	'ngResource',
	'ngRoute',
	'ngSanitize',
	'ngTouch',
	'ngMaterial',
	'ui.router',
	'ui.bootstrap',
	'myApp'
	])
	.controller('LoginCtrl', ['$scope', 'AuthModel', '$cookies', 'UserModel', function ($scope, AuthModel, $cookies, UserModel) {
		var init = function() {
			$scope.signingIn = false;

			if($cookies.uid) {
				UserModel.getUser($cookies.uid).then(function(user) {
					if(!user.error) {
						$scope.isLoggedIn = true;
						location.href = location.href.replace(/login.html/,'');
					}
				});
			}
		};

		$scope.signin = function() {
			$scope.signingIn = true;
			AuthModel.signIn($scope.email, $scope.pass).then(function(response) {
				if(response.code === '401') {
					$scope.signingIn = false;
				} else {
					location.href = location.href.replace(/login.html/,'');
				}
			});
		};

		$scope.cancelSignin = function() {
			$scope.signingIn = false;
		};

		init();
	}]);

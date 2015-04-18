'use strict';

angular.module('myApp')
	.controller('LoginCtrl', ['$scope', '$state', 'AuthModel', function ($scope, $state, AuthModel) {
		// UserModel.getUser(20).then(function(user) {console.log(user);});
		var init = function() {
			$scope.signingIn = false;
		};

		$scope.signin = function() {
			$scope.signingIn = true;
			AuthModel.login($scope.email, $scope.pass).then(function(response) {
				if(response.code === '401') {
					$scope.signingIn = false;
				} else {
					$scope.loggedIn(true);
					$state.go('main');
				}
			});
		};

		$scope.cancelSignin = function() {
			$scope.signingIn = false;
		};

		init();
	}]);

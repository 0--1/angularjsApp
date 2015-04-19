'use strict';

angular.module('myApp')
.controller('MainCtrl', ['$scope', '$state', 'UserModel', '$cookies', function ($scope, $state, UserModel, $cookies) {
	var init = function() {
		$scope.isLoggedIn = false;

		if($cookies.uid) {
			UserModel.getUser($cookies.uid).then(function(user) {
				if(user.error) {
					// $state.go('login');
				} else {
					$scope.isLoggedIn = true;
					$state.go('home');
				}
			});
		} else {
			location.href = location.href.replace(/#[-a-zA-Z0-9_#\/]+/,'login.html');
		}
	};

	$scope.loggedIn = function(state) {
		if(typeof state !== 'undefined') {
			$scope.isLoggedIn = state;
			if(!state) {
				$state.go('login');
			}
		}

		return $scope.isLoggedIn;
	};

	init();
	// AuthModel.login('behroozkamali@yahoo.com', 'kamali');
}]);

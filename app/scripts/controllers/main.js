'use strict';

angular.module('myApp')
.controller('MainCtrl', ['$scope', '$state', 'UserModel', '$cookies', function ($scope, $state, UserModel, $cookies) {
	var init = function() {
		$scope.isLoggedIn = false;
		if($cookies.uid) {
			UserModel.getUser($cookies.uid).then(function(user) {
				console.log(user);
				if(user.error) {
					$state.go('login');
					$scope.isLoggedIn = false;
				} else {
					$scope.isLoggedIn = true;
				}
			});
		} else {
			$state.go('login');
		}
	};

	$scope.loggedIn = function(state) {
		if(typeof state !== 'undefined') {
			$scope.isLoggedIn = state;
		}

		return $scope.isLoggedIn;
	};

	init();
	// AuthModel.login('behroozkamali@yahoo.com', 'kamali');
}]);

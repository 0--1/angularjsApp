'use strict';

angular.module('myApp')
.controller('HomeCtrl', ['$scope', function ($scope) {
	var init = function() {
		$scope.test = 'test';
	};

	init();
}]);

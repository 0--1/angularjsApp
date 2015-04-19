'use strict';

angular.module('myApp')
.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise('/home');

	$stateProvider
		.state('home', {
			url: '/home',
			templateUrl: 'views/home.html',
			controller: 'HomeCtrl'
		});
}]);

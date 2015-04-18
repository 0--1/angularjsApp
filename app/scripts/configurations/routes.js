'use strict';

angular.module('myApp')
.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise('/main');

	$stateProvider
		.state('main', {
			url: '/main',
			templateUrl: 'views/main.html',
			controller: 'MainCtrl'
		})
		.state('login', {
			url: '/login',
			templateUrl: 'views/includes/login.html',
			controller: 'LoginCtrl'
		});
}]);

'use strict';

angular.module('myApp')
.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
	$urlRouterProvider.otherwise('/');

	$stateProvider
		.state('loading', {
			url: '/loading',
			templateUrl: 'views/includes/loading.html',
			controller: 'LoadingCtrl'
		})
		.state('home', {
			url: '/',
			templateUrl: 'views/home.html',
			controller: 'HomeCtrl'
		})
		.state('login', {
			url: '/login',
			templateUrl: 'views/login.html',
			controller: 'LoginCtrl'
		});
}]);

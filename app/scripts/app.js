'use strict';

/**
* @ngdoc overview
* @name emergencyApp
* @description
* # emergencyApp
*
* Main module of the application.
*/
angular
.module('emergencyApp', [
	'ngAnimate',
	'ngCookies',
	'ngResource',
	'ngRoute',
	'ngSanitize',
	'ngTouch'
	])
.config(function ($routeProvider) {
	$routeProvider
	.when('/', {
		templateUrl: 'views/main.html',
		controller: 'MainCtrl'
	})
	.when('/about', {
		templateUrl: 'views/about.html',
		controller: 'AboutCtrl'
	})
	.otherwise({
		redirectTo: '/'
	});
});

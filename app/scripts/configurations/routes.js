'use strict';

angular.module('myApp')
  .config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
  	$urlRouterProvider.otherwise('/');

  	$stateProvider
  		.state('main', {
  			url: '/main',
  			templateUrl: 'views/main.html',
  			controller: 'MainCtrl'
  		});
  }]);

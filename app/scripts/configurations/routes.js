'use strict';

/**
 * @ngdoc service
 * @name emergencyApp.routes
 * @description
 * # routes
 * Service in the emergencyApp.
 */
angular.module('emergencyApp')
  .config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
  	$urlRouterProvider.otherwise('/');

  	$stateProvider
  		.state('main', {
  			url: '/main',
  			templateUrl: 'views/main.html',
  			controller: 'MainCtrl'
  		});
  }]);

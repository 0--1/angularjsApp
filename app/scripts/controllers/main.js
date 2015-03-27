'use strict';

/**
 * @ngdoc function
 * @name emergencyApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the emergencyApp
 */
angular.module('emergencyApp')
  .controller('MainCtrl', function ($scope, $resource, $http, $cookies) {
  	var req = {
  		method: 'POST',
  		url: 'http://localhost:8888/pronto/api/pronto/login',
  		headers: {
  			'AUTH_USER': 'behroozkamali@yahoo.com',
  			'AUTH_PW': 'kamali'
  		}
  	};
  	$http(req)
  		.success(function(response) {
	  		console.log(response);
	  		console.log($cookies);
	  	}).error(function() {
	  		console.log(arguments);
	  	});
    // var user = $resource('http://localhost:8888/pronto/api/pronto/user/:userId', {userId: '@id'});
    // console.log(user.get({userId: 20}));
  });

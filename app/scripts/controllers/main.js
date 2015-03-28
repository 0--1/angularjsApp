'use strict';

/**
 * @ngdoc function
 * @name emergencyApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the emergencyApp
 */
angular.module('emergencyApp')
	.controller('MainCtrl', function ($scope, Resource, $http, $cookies) {
		var headers = {
				'AUTH_USER': 'behroozkamali@yahoo.com',
				'AUTH_PW': 'kamali'
			},
			req = {
				method: 'POST',
				url: 'http://localhost:8080/pronto/api/pronto/login',
				headers: headers
			};

		if(!!$cookies.uid && !!$cookies.ckey && !!$cookies.hkey) {
			headers.UID = $cookies.uid;
			headers.CKEY = $cookies.ckey;
			headers.HKEY = $cookies.hkey;
		}

		var test = Resource('http://localhost:8080/pronto/api/pronto/user/20');
		test.get().then(function(response) {
			console.log(response);
		}, function(error) {
			console.log(error);
		});

		// $http(req)
		// 	.success(function(response) {
		// 		console.log(response);
		// 		if(response.ckey && response.hkey && response.uid) {
		// 			$cookies.ckey = response.ckey;
		// 			$cookies.hkey = response.hkey;
		// 			$cookies.uid = response.uid;
		// 		}
		// 		console.log($cookies);
		// 	}).error(function(response, code) {
		// 		if(code === 401) {
		// 			delete $cookies.ckey// = response.ckey;
		// 			delete $cookies.hkey// = response.hkey;
		// 			delete $cookies.uid// = response.uid;
		// 		}
		// 	});
	});

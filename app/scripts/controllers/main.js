'use strict';

angular.module('myApp')
	.controller('MainCtrl', function ($scope, SERVER, CONFIG, Resource, $http, $cookies) {
		// var headers = {
		// 		'AUTH_USER': 'behroozkamali@yahoo.com',
		// 		'AUTH_PW': 'kamali'
		// 	},
		// 	req = {
		// 		method: 'POST',
		// 		url: 'http://localhost:8080/pronto/api/pronto/login',
		// 		headers: headers
		// 	};

		// if(!!$cookies.uid && !!$cookies.ckey && !!$cookies.hkey) {
		// 	headers.UID = $cookies.uid;
		// 	headers.CKEY = $cookies.ckey;
		// 	headers.HKEY = $cookies.hkey;
		// }

		var test = new Resource(SERVER.dev + CONFIG.api.root + CONFIG.api.user);
		test.get('', {userId: 20}).then(function(response) {
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

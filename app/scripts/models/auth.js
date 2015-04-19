'use strict';

angular.module('myApp').service('AuthModel', ['SERVER', 'CONFIG', 'Resource', '$cookies', function(SERVER, CONFIG, Resource, $cookies) {
	angular.extend(this, new Resource(SERVER.dev + CONFIG.api.root));

	var removeAuthCookies = function() {
		delete $cookies.ckey;
		delete $cookies.hkey;
		delete $cookies.uid;
	};

	this.signIn = function(username, password) {
		var headers = {
				AUTH_USER: username,
				AUTH_PW: password
			},
			config = {
				headers: headers
			};

		return this.post('login', undefined, {}, config).then(
			function(response) {
				if(response.ckey && response.hkey && response.uid) {
					$cookies.ckey = response.ckey;
					$cookies.hkey = response.hkey;
					$cookies.uid = response.uid;
				}
				return response;
			},
			function(error) {
				removeAuthCookies();
				return error;
			}
		);
	};

	this.signOut = function() {
		this.delete('logout', undefined, {}).then(function() {
			removeAuthCookies();
			location.href = location.href.replace(/#[-a-zA-Z0-9_#\/]+/,'login.html');
		});
	};
}]);

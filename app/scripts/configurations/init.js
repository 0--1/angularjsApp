'use strict';

angular.module('myApp').run(['$rootScope', '$state', 'Application', 'RouteFilter',
function($rootScope, $state, Application, RouteFilter) {
	RouteFilter.register('login', 'authorized', 'You are already logged in.', function() {
		return !Application.isAuthenticated();
	});

	RouteFilter.register(['home'], 'unauthorized', 'You are not authorized to visit this page!', function() {
		return Application.isAuthenticated();
	}, 'login');

	RouteFilter.register('loading', 'noLoadingWhenReady', 'The application has already been loaded.', function() {
		return !Application.isAuthenticated();
	}, 'home');

	$rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState) {
		console.log(fromState.name + '->' + toState.name);
		if(toState.name === 'loading' && fromState.name === '') {
			return;
		}

		if(!Application.isReady()) {
			event.preventDefault();
			Application.registerListener(function() {
				$state.go(toState.name === 'login' ? 'home' : toState.name);
			});
			$state.go('loading');
			return;
		}

		RouteFilter.run(toState.name, event);
	});
}]);
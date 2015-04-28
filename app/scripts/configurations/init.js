'use strict';

angular.module('myApp').run(['$rootScope', '$state', 'Application', 'RouteFilter',
function($rootScope, $state, Application, RouteFilter) {
	RouteFilter.register('authorized', ['login'], function() {
		return !Application.isAuthenticated();
	});

	RouteFilter.register('unauthorized', ['home'], function() {
		return Application.isAuthenticated();
	}, 'login');

	RouteFilter.register('noLoadingWhenReady', ['loading'], function() {
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
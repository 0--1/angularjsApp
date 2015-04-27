'use strict';

angular.module('myApp').run(['$rootScope', '$state', 'Application', 'RouteFilter',
function($rootScope, $state, Application, RouteFilter) {
	RouteFilter.register('authorized', ['login'], function() {
		return !Application.isAuthenticated();
	}, 'home');

	RouteFilter.register('unauthorized', ['home'], function() {
		return Application.isAuthenticated();
	}, 'login');

	$rootScope.$on('$stateChangeStart', function(event, toState) {
		if(toState.name === 'loading') {
			return;
		}

		if(!Application.isReady()) {
			event.preventDefault();
			$state.go('loading');
			return;
		}

		RouteFilter.run(toState.name, event);
	});
}]);
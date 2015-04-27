'use strict';

angular.module('myApp').config(['$logProvider', function($logProvider) {
	$logProvider.debugEnabled(true);
}]);

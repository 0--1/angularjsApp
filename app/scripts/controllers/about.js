'use strict';

/**
 * @ngdoc function
 * @name emergencyApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the emergencyApp
 */
angular.module('emergencyApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });

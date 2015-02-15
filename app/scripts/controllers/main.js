'use strict';

/**
 * @ngdoc function
 * @name emergencyApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the emergencyApp
 */
angular.module('emergencyApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });

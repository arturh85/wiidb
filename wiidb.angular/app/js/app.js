'use strict';


// Declare app level module which depends on filters, and services
angular.module('wiidb', ['wiidb.filters', 'wiidb.services', 'wiidb.directives']).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/tdb', {template: 'partials/tdb.html', controller: TDBController});
    $routeProvider.otherwise({redirectTo: '/tdb'});
  }]);

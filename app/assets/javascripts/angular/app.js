angular
  .module('AngularRails', [
    'ngRoute',
    'templates',
    'AllServices'
  ]).config(function ($routeProvider, $locationProvider) {
      $routeProvider
      .when('/', {
        templateUrl: 'users/sign_up.html',
        controller: 'UserSignUpCtrl'
      })
      .when('/sign_in', {
        templateUrl: 'users/sign_in.html',
        controller: 'UserSignUpCtrl'
      })
      .when('/browse', {
        templateUrl: 'browse/_list.html',
        controller: 'UserCompatibleListCtrl'
      });
      //$locationProvider.html5Mode(true);
  });

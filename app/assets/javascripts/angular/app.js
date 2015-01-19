angular
  .module('AngularRails', [
    'ngRoute',
    'templates'
  ]).config(function ($routeProvider, $locationProvider) {
      $routeProvider
      .when('/', {
        templateUrl: 'users/home.html',
        controller: 'HomeCtrl'
      })
      .when('/sign_up', {
        templateUrl: 'users/sign_up.html',
        controller: 'UserSignUpCtrl'
      })
      .when('/sign_in', {
        templateUrl: 'users/sign_in.html',
        controller: 'UserSignInCtrl'
      })
      .when('/browse', {
        templateUrl: 'browse/_list.html',
        controller: 'UserCompatibleListCtrl'
      });
      //$locationProvider.html5Mode(true);
  });

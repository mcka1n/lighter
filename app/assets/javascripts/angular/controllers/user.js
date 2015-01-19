angular.module('AngularRails')
  .controller('UserSignUpCtrl', ['$rootScope', '$scope', '$routeParams', '$http', '$location', '$timeout', function($rootScope, $scope, $routeParams, $http, $location, $timeout) {
    console.log("@signup");
    $scope.login_user = {email: null, password: null};
    $scope.login_error = {message: null, errors: {}};
    $scope.register_user = {user_name: null, email: null, orientation: null, age: null, gender: null, age_range: null};
    $scope.register_error = {message: null, errors: {}};

    var base_url = 'http://localhost:3000/v1/';

    $scope.login = function() {
      $scope.submit({method: 'POST',
                     url: base_url + 'sign_in',
                     data: {user_name: $scope.login_user.user_name},
                            success_message: "Welcome to Lighter!",
                            error_entity: $scope.login_error});
      };

    $scope.register = function() {
      $scope.submit({method: 'POST',
                     url: base_url + 'users',
                     data: {email: $scope.register_user.email,
                            user_name: $scope.register_user.user_name,
                            orientation: $scope.register_user.orientation,
                            age: $scope.register_user.age,
                            gender: $scope.register_user.gender,
                            age_range: $scope.register_user.age_range},
                            success_message: "Welcome to Lighter!",
                            error_entity: $scope.register_error});
    };

    //
    $scope.submit = function(parameters) {
      $scope.reset_messages();

      $http({method: parameters.method,
        url: parameters.url+ '.json',
        data: parameters.data})
        .success(function(data, status){
          console.log("==> status: "+status);

          // Due to the lack of real http status
          if (data.error) {
            parameters.error_entity.message = data.error;
          }else{
            parameters.error_entity.message = parameters.success_message;
            $rootScope.current_user = data._id.$oid;
            $scope.reset_users();
            filterTextTimeout = $timeout(function() {
              $location.path('/browse');
            }, 900); // delay ms
          }

        })
        .error(function(data, status){
          //console.log("stringify data: "+JSON.stringify(data.errors));
          if (status == 422) {
            parameters.error_entity.errors = data.errors;
          } else {
            if (data.error) {
              parameters.error_entity.message = data.error;
            } else {
              // note that JSON.stringify is not supported in some older browsers, we're ignoring that
              parameters.error_entity.message = "Unexplained error, potentially a server error, please report via support channels as this indicates a code defect.  Server response was: " + JSON.stringify(data);
            }
          }
        });
      };

      $scope.reset_messages = function() {
        $scope.login_error.message = null;
        $scope.login_error.errors = {};
        $scope.register_error.message = null;
        $scope.register_error.errors = {};
      };

      $scope.reset_users = function() {
        $scope.login_user = null;
        $scope.register_user = null;
      };
    //

  }])
  .controller('UserCompatibleListCtrl', ['$rootScope', '$scope', '$routeParams', '$http', '$location', '$timeout', 'CompatibleUsers', function($rootScope, $scope, $routeParams, $http, $location, $timeout, CompatibleUsers) {
    $scope.current_user = $rootScope.current_user;
    $scope.compatible_users = CompatibleUsers.query({id: $scope.current_user});
  }]);

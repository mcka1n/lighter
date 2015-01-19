var base_url = 'http://localhost:3000/v1/';

angular.module('AngularRails.services', []).
value('version', '0.1');


var AllServices = angular.module('AllServices', ['ngResource', 'ngSanitize']);

AllServices.factory('CompatibleUsers', ['$resource',
function($resource){
  return $resource(base_url + 'users/:id/compatible_users', {}, {
    query: {method:'GET', params:{id:'@id'}, isArray:true}
  });
}]);

var app = angular.module('myApp', []);

app.controller('slidecontroller', function($scope, $http, $window, $rootScope){
	
	$scope.getSlide = function(){
		$http({
			url:'http://localhost:8888/slide/',
			method: 'GET'
		}).then(function(response){
			$scope.getslide = response.data.DATA;
		}, function(response){
			alert('failed to call all slide');
		})
	}
	$scope.getSlide();
	
	/*$scope.addSlide = function(){
		$http({
			url:'http://localhost:8888/slide',
			method:'POST',
			data:{
				'name': $scope.name,
				'description': $scope.desc,
				'url': $scope.image,
				'status': $scope.status,
			}
		}).then(function(response){
			$scope.getSlide();
		}, function(response){
			alert('failed to add slide.');
		});
	}*/
	
	$scope.deleteSlide = function(id){
		$http({
			url : 'http://localhost:8888/slide/'+id,
			method : 'DELETE'
		}).then(function(response){
			$scope.getSlide();
		},function(response){
			alert('failed to delete slide.');
		})
	}
	
	
});
	
	
	

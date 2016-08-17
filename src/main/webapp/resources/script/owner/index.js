			WW=$(document).width();
			NH=$("#nav").height();
			SH=$("#slide").height();

$(document).ready(function() {
	
	
	$("#searchbtn").click(function(){
		$("#mysearchbtn").toggle();
	});
	
	/*$(".default").mouseover(function() {
		alert(1);
		$(this).hide();
		$(this).next().show();
	});
	
	$(".cover").mouseleave(function(){
		$(this).hide();
		$(this).prev().show();
	});*/
	
	$(document).on('mouseenter','.default',function(){
		$(this).hide();
		$(this).next().show();
	});
	
	$(document).on('mouseleave','.cover',function(){
		$(this).hide();
		$(this).prev().show();
	});

});



var app = angular.module('myApp', []);
app.controller('psersonCtrl', function($scope, $http) {
	//Category
	    	$scope.selectType = function(){
    		$http({
    			url : 'http://localhost:8888/resttype',
    			method : 'GET'
    		}).then(function(obj) {
    			console.log("true");
    			$scope.myData = obj.data.DATA;
    			console.log($scope.myData);
    		}, function(response) {
    			alert("Incorrect");
    			$scope.myData = obj.data;
    		});
			}
    	
    	//End Category
    	$scope.selectCategory = function(){
    		$http({
    			url : 'http://localhost:8888/maincategory/',
    			method : 'GET'
    		}).then(function(objcat){
    			console.log("Hello Cat");
    			$scope.myCat = objcat.data.DATA;
    			console.log($scope.myCat.id);
    		}, function(response){
    			alert("Yeah");
    			$scope.myCat = objcat.data;
    		})
    	}
    	$scope.selectType();
    	$scope.selectCategory();

});




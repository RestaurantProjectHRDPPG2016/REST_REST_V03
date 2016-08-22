$("#searchbtn").click(function(){
		$("#mysearchbtn").toggle();
	});
	
	$("#location").click(function(){
		$("#	mylocation").toggle();
	});

	$(document).on('mouseenter','.default',function(){
		$(this).hide();
		$(this).next().show();
	});
	
	$(document).on('mouseleave','.cover',function(){
		$(this).hide();
		$(this).prev().show();
	});



var app = angular.module('myApp', []);

app.controller('adminCtrl', function($scope, $http, $window, $rootScope){
	

	// TODO: define base url
// var BASE_URL = "http://localhost:";
	
	// TODO: declare user object
	var MAINCATEGORY = {};
	
	// TODO: default filter
	$scope.filter = {
		page: 1,
		limit: 18
	};
	
	// TODO:
	$scope.paging = {};
	
	// TODO:
	var PAGINATION = angular.element('#pagination'); 
	
	// TODO: load Pagination
	MAINCATEGORY.loadPagination = function(response){
		
		// TODO: Initialize pagination setting
		$scope.paging = {
			totalPages: response.Pagination.TOTAL_PAGES,
			totalRecords: response.Pagination.TOTAL_COUNT,
			currentPage: response.Pagination.PAGE,
			limit: response.Pagination.LIMIT
		};
		// TODO:
		PAGINATION.bootpag({
	        total: $scope.paging.totalPages,
	        page: $scope.paging.currentPage,
	        leaps: true,
	        firstLastUse: true,
	        first: '←',
	        last: '→',
	        next: 'Next',
	        prev: 'Prev',
	        maxVisible: 18
	    });	    
	};
	
	// TODO: add listener to page click
	PAGINATION.on("page", function(event, pageNumber){
		$scope.filter.page = pageNumber;
		MAINCATEGORY.selectCategory();
	});
	
	
	$scope.$watch('category', function(newValue){
		$rootScope.subCategoryId = newValue;
	});

	MAINCATEGORY.selectCategory = function(){
		$http({
			url : 'http://localhost:8888/maincategory',
			params: $scope.filter,
			method : 'GET'
		}).then(function(objcat){
			$scope.myCat = objcat.data.DATA;
			MAINCATEGORY.loadPagination(objcat.data);
		}, function(response){
			alert("fail");
		});
	}
	
	
	// TODO: Reload data again
	MAINCATEGORY.reload = function(filter){
		$scope.filter = filter;
		MAINCATEGORY.selectCategory();
	};
	MAINCATEGORY.selectCategory();
	
	$scope.deleteCategory = function(myid){
		$http({
			url : 'http://localhost:8888/maincategory/'+myid,
			method : 'DELETE'
		}).then(function(objcat){
			alert("Delete Success ");
			$scope.selectCategory();
		},function(response){
			alert('failed');
		})
	}
	
	$scope.changeMode =function(mode){
		if(mode==0){
			$scope.name = "";
			$scope.img1 = "";
			$scope.img2 = "";
			$scope.t_id = "";
		$("#addCat").show();
		$("#updateCat").hide();
		}
	};
	$scope.addCategory = function(){
		alert("Weloceot add");
		alert($scope.t_id);
		var filename1 = $('#img1').val();
		var filename2 = $('#img2').val();
	    if (filename1.substring(3,11) == 'fakepath' )    { 
	            filename1 = filename1.substring(12, filename1.length); 
	        }
	        if (filename2.substring(3,11) == 'fakepath' )    { 
	            filename2 = filename2.substring(12, filename2.length); 
	        }
		$http({
			url:'http://localhost:8888/maincategory/',
			method:'POST',
			data:{
				'name': $scope.name,
				't_id': $scope.rest_type,
				'img1': filename1,
				'img2': filename2
			}
		}).then(function(response){
			
			$scope.selectCategory();
	}, function(response){
		alert('failed');
	});
	}
	
	$scope.editCategory = function(newData) {
		$("#addCat").hide();
		$("#updateCat").show();
		console.log(newData);
		$scope.id = newData.c.id;
		$scope.img1= newData.c.img1;
		$scope.img2= newData.c.img2;
		$scope.name=newData.c.name;
		$scope.t_id=newData.c.t_id;
	}
	$scope.updateCategory = function(){
		$http({
		url:'http://localhost:8888/maincategory/',
		method:'PUT',
		data:{
			'id' : $scope.id,
			'name' : $scope.name,
			'img1' : $scope.img1,
			'img2' : $scope.img2,
			't_id' : $scope.t_id
		}
		}).then(function(response){
			$scope.selectCategory();
	}, function(response){
		alert("fail maincateory put");
	});
	}


	/* Start Restaurant Type */

		// GetALL Type of restaurant
		$scope.getRestType = function(){
			$http({
				url: 'http://localhost:8888/resttype',
				method:'GET'
			}).then(function(response){
				$scope.myrestType=response.data.DATA;
				
			}, function(response){
				alert('failed');
			});
		}
		$scope.getRestType();
		
		$scope.addRestType = function(){
			$http({
				url:'http://localhost:8888/resttype/',
				method:'POST',
				data:{
					'name': $scope.name
				}
			}).then(function(response){
				$scope.getRestType();
		}, function(response){
			alert('failed');
		});
		}
		
		$scope.deleteRestType = function(id){
			$http({
				url : 'http://localhost:8888/resttype/'+id,
				method : 'DELETE'
			}).then(function(objcat){
				$scope.getRestType();
			},function(response){
				alert('failed');
			})
		}
		
		$scope.changeRestType =function(mymode){
		if(mymode==1){
			$scope.name = "";
			$("#add").show();
			$("#update").hide();
			}
		};
		
		$scope.editRestType = function(mynew){
			$("#add").hide();
			$("#update").show();
			$scope.id = mynew.rt.id;
			$scope.name= mynew.rt.name;
		}
		
		$scope.updateRestType = function(){
			$http({
			url:'http://localhost:8888/resttype/',
			method:'PUT',
			data:{
				'id' : $scope.id,
				'name' : $scope.name
			}
			}).then(function(response){
				$scope.getRestType();
		}, function(response){
			alert("fail");
		});
		}


	/* End Restaurant Type */
		

		// GetProvince
		$scope.getProvince = function(){
			$http({
				url: 'http://localhost:8888/cities',
				method:'GET'
			}).then(function(response){
				$scope.myProvince=response.data.DATA;
			}, function(response){
				alert('failed To call all data');
			});
		}
		$scope.getProvince();
		
		// GetDistrict
		$scope.getDistrict = function(cityId){
			// $scope.city = $scope.province;
			$http({
				url: 'http://localhost:8888/cities/'+cityId+'/districts',
				method:'GET'
			}).then(function(response){
				
				$scope.myDistrict=response.data.DATA;
			}, function(response){
				alert('failed To call all data');
			});
		}
	
		// Getcommune
		$scope.getCommune = function(districtId){
			$http({
				url: 'http://localhost:8888/districts/'+districtId+'/commnunes',
				method:'GET'
			}).then(function(response){
				$scope.myCommune=response.data.DATA;
			}, function(response){
				alert('failed To call all data');
			});
		}
});

/* Start Resturant Controller */

app.controller('restCtrl', function ($scope, $http, $window, $rootScope){
// Pagination
	
	// TODO: declare user object
	var RESTAURANT = {};
	
//	$scope.name= name;
//	$scope.category = category;
//	$scope.province = province;
//	$scope.district = district;
//	$scope.commune = commune;
	alert("Province" +$scope.province);
	// TODO: default filter
	$scope.filter = {
		page		: 1,
		limit		: 12,
		name 		: $scope.name,	
		c_id 		: $scope.category,
		type_id		: '',
		province 	: $scope.province,	
		district 	: $scope.district,	
		commune		: $scope.commneu
	};
	
	
	
	
	// TODO:
	$scope.paging = {};
	
	// TODO:
	var PAGINATION = angular.element('#paginationRest'); 
	
	// TODO: load Pagination
	RESTAURANT.loadPagination = function(response){
		
		// TODO: Initialize pagination setting
		$scope.paging = {
			totalPages: response.Pagination.TOTAL_PAGES,
			totalRecords: response.Pagination.TOTAL_COUNT,
			currentPage: response.Pagination.PAGE,
			limit: response.Pagination.LIMIT
		};
		// TODO:
		PAGINATION.bootpag({
	        total: $scope.paging.totalPages,
	        page: $scope.paging.currentPage,
	        leaps: true,
	        firstLastUse: true,
	        first: '←',
	        last: '→',
	        next: 'Next',
	        prev: 'Prev',
	        maxVisible: 12
	    });	    
	};
	
	// TODO: add listener to page click
	PAGINATION.on("page", function(event, pageNumber){
		$scope.filter.page = pageNumber;
		RESTAURANT.getRest();
	});
	
	$scope.$watch('category', function(newValue){
		$rootScope.subCategoryId = newValue;
	});
	
	// GetALL
	RESTAURANT.getRest = function(){
		$http({
			url: 'http://localhost:8888/restaurant',
			method:'GET',
			params: $scope.filter
		}).then(function(response){
			console.log(response);
			$scope.rest=response.data.DATA;
			RESTAURANT.loadPagination(response.data);
			if($scope.rest.length <=0){
				$window.location.href=("/404");
			}
			
		}, function(response){
			console.log(response);
			alert('failed To call all data');
		});
	}
	
	$scope.search = function(){
		console.log($scope.province);
		if($scope.province==undefined){
			$scope.province='';
			alert("province undefinded yes yse");
		}
		if($scope.province==undefined){
			$scope.district='';
		}
		if($scope.province==undefined){
			$scope.commune='';
		}
		
		$scope.filter.name =$scope.name;
		$scope.filter.c_id = $scope.category.id;
		$scope.filter.type_id='';
		$scope.filter.province =$scope.province.id;
		$scope.filter.district =$scope.district.id;
		$scope.filter.commune =$scope.commune.id;
		RESTAURANT.getRest();
		$window.location.href="/search_result?name="+$scope.name+"&category="
		+$scope.filter.c_id+"&province="+$scope.filter.province+"&district="+$scope.filter.district+"&commune="+$scope.filter.commune;
		
	}
	
	// TODO: Reload data again
	$scope.reload = function(filter){
		$scope.filter = filter;
		RESTAURANT.getRest();
	};
	
	RESTAURANT.getRest();
	


	
	RESTAURANT.addRestaurant = function(){
		b=true;
		$scope.btnButton='Save';
		var frmData = new FormData();
		var tel = $('input[name=tel]');

		$.each(tel, function(key, e){
			frmData.append('telephones', $(e).val());
		});
		
		
		var restaurant_files = angular.element('#img')[0].files;
		for(var i=0; i<restaurant_files.length; i++){
			frmData.append("image", restaurant_files[i]);
		}
		
		var menu_files = angular.element('#menus')[0].files;
		
		for(var i=0; i<menu_files.length; i++){
			frmData.append("menus", menu_files[i]);
		}
		
		frmData.append('name', $scope.name);
		frmData.append('type', $rootScope.subCategoryId);
		frmData.append('description', $scope.desc);
		frmData.append('delivery', $scope.delivery);
		frmData.append('home', $scope.home);
		frmData.append('street', $scope.street);
		frmData.append('province',$scope.province.id);
		frmData.append('district', $scope.district.id);
		frmData.append('commune', $scope.commune.id);
		frmData.append('latitude', $scope.latitude);
		frmData.append('longitude', $scope.longitude);
		
		
		$http({
			url:'http://localhost:8888/restaurant',
			method: 'POST',
			data: frmData,
			transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
		}).then(function(response){
			console.log(response.data);
			$scope.getRest();
		}, function(error){
			console.log(error.data);
			alert('failed to upload data! Please Try again Youra !!!!!');
			$scope.getRest();
		});
}		
	var btnButton='';
 	$scope.event= function(){
 		if(b==true){ 
 			RESTAURANT.addRestaurant();
 		}
 		else{
 			console.log("UPDATEME");
 			RESTAURANT.updateRestaurant();
 		}
 	}
	
 	$scope.addButton=function(){
 		b=true;
 		$scope.btnButton='ADD';
 	}
	$scope.getupdateRestauratn= function(rest){
	 	b=false;
	 	$scope.btnButton='UPDATE';
	 	console.log(rest);
	 	id=rest.r.id;
		 	$scope.name = rest.r.name;
		 	$scope.category=rest.r.sub_id + '';
		 	$scope.delivery = rest.r.delivery;
		 	$scope.desc=rest.r.desc;
		 	$scope.home=rest.r.home;
		 	$scope.street=rest.r.street;
		 	$scope.district = rest.r.district;
		 	$scope.commune = rest.r.commune;
		 	$scope.latitude =rest.r.latitude;
		 	$scope.longitude =rest.r.longitude;
		 	
		 	angular.forEach($scope.myProvince, function(item){
		 		if (item.khmer_name === rest.r.province){
		 			$scope.province = item;
		 			$scope.getDistrict(item.id);
		 			return;
		 		}
		 	});
		 	
		 	angular.forEach($scope.myDisctrict, function(item){
		 		if (item.khmer_name === rest.r.disctrict){
		 			$scope.district = item;
		 			return;
		 		}
		 	});
		 	
		 	angular.forEach($scope.myCommune, function(item){
		 		if (item.khmer_name === rest.r.commune){
		 			$scope.commune = item;
		 			return;
		 		}
		 	});
		 	
	}
	
	RESTAURANT.updateRestaurant= function(){
		// console.log(id);
		var frmData = new FormData();
		var tel = $('input[name=tel]');

		$.each(tel, function(key, e){
			console.log(e);
			frmData.append('telephones', $(e).val());
		});
		var restaurant_files = angular.element('#img')[0].files;
		for(var i=0; i<restaurant_files.length; i++){
			frmData.append("image", restaurant_files[i]);
		}
		
		var menu_files = angular.element('#menus')[0].files;
		
		for(var i=0; i<menu_files.length; i++){
			frmData.append("menus", menu_files[i]);
		}
		frmData.append('id',id);
		frmData.append('name', $scope.name);
		frmData.append('type', $rootScope.subCategoryId);
		frmData.append('description', $scope.desc);
		frmData.append('delivery', $scope.delivery);
		frmData.append('home', $scope.home);
		frmData.append('street', $scope.street);
		frmData.append('province',$scope.province.id);
		frmData.append('district', $scope.district.id);
		frmData.append('commune', $scope.commune.id);
		frmData.append('latitude', $scope.latitude);
		frmData.append('longitude', $scope.longitude);
		
		console.log(frmData);
	
		$http({
			url:'http://localhost:8888/restaurantUpdate',
			method: 'POST',
			data: frmData,
			transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
		}).then(function(response){
			console.log(response.data);
			RESTAURANT.getRest();
		}, function(error){
			console.log(error.data);
			alert('failed to upload data! Please Try again Youra !!!!!');
			$scope.getRest();
		});
	}
	
});


app.controller('MyAdCtrl', function ($scope, $http, $window, $rootScope){
	// GetRestaurant By ID
	
	$scope.getRestByID = function(id){
		$http({
			url: 'http://localhost:8888/restaurant/'+id,
			method:'GET',
		}).then(function(response){
			console.log(response);
			$scope.restByID=response.data.DATA;
			
	}, function(response){
			console.log(response);
			alert('failed To call all data');
		});
	}
	$scope.getRestByID (rest_id);
	
	
});

/* ENd Restuarant Controller */

app.controller('MyCatCtrl', function ($scope, $http, $window, $rootScope){
	// GetRestaurant By ID
// getRestaurantByCategory(Cate ID)
	
	// TODO: declare user object
	var RESTAURANT = {};
	
	// TODO: default filter
	$scope.filter = {
		page: 1,
		limit: 12
	};
	
	// TODO:
	$scope.paging = {};
	
	// TODO:
	var PAGINATION = angular.element('#paginationbyCategory'); 
	
	// TODO: load Pagination
	RESTAURANT.loadPagination = function(response){
		
		// TODO: Initialize pagination setting
		$scope.paging = {
			totalPages: response.Pagination.TOTAL_PAGES,
			totalRecords: response.Pagination.TOTAL_COUNT,
			currentPage: response.Pagination.PAGE,
			limit: response.Pagination.LIMIT
		};
		// TODO:
		PAGINATION.bootpag({
	        total: $scope.paging.totalPages,
	        page: $scope.paging.currentPage,
	        leaps: true,
	        firstLastUse: true,
	        first: '←',
	        last: '→',
	        next: 'Next',
	        prev: 'Prev',
	        maxVisible: 12
	    });	    
	};
	
	// TODO: add listener to page click
	PAGINATION.on("page", function(event, pageNumber){
		$scope.filter.page = pageNumber;
		RESTAURANT.getRest();
	});
	
	
	
	RESTAURANT.getRestaurantByCategory= function(cat_id){
	$http({
		url: 'http://localhost:8888/restaurant/category/'+cat_id,
		params: $scope.filter,
		method:'GET'
	}).then(function(response){
		console.log(response);
		$scope.MyCategories=response.data.DATA;
		RESTAURANT.loadPagination(response.data);
		if($scope.MyCategories.length <=0){
			$window.location.href=("/404");
		}
		
	}, function(response){
		console.log(response);
	});
}
	
	// TODO: Reload data again
	$scope.reload = function(filter){
		$scope.filter = filter;
		RESTAURANT.getRestaurantByCategory(cat_id);
	};
	RESTAURANT.getRestaurantByCategory(cat_id);
});


app.controller('MyTypeCtrl', function ($scope, $http, $window, $rootScope){
// getRestaurantByType(Type ID)
	RESTAURANT.getRestaurantByType = function(type_id){
		$http({
			url: 'http://localhost:8888/restaurant/type/'+type_id,
			params: $scope.filter,
			method:'GET'
		}).then(function(response){
			console.log(response);
			$scope.MyRestType=response.data.DATA;
			RESTAURANT.loadPagination(response.data);
			
			if($scope.MyRestType.length <=0){
				$scope.getNotFound();
			}
			
		}, function(response){
			console.log(response);
			/* alert('failed To call Restaurant Type'); */
		});
	}
	// TODO: Reload data again
	$scope.reload = function(filter){
		$scope.filter = filter;
		RESTAURANT.getRestaurantByType(type_id);
	};
	RESTAURANT.getRestaurantByType(type_id);
	
});
//
// GET rest By ID


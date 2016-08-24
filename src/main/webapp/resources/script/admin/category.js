
var checkIsDefined = function(val){
	if (typeof name !== "undefined" && val != undefined)
		return val;
	return '';
}

$(document).ready(function() {
	$("#searchbtn").click(function() {
		$("#mysearchbtn").toggle();
	});

	$("#location").click(function() {
		$("#	mylocation").toggle();
	});

	$(document).on('mouseenter', '.default', function() {
		$(this).hide();
		$(this).next().show();
	});

	$(document).on('mouseleave', '.cover', function() {
		$(this).hide();
		$(this).prev().show();
	});

});

var app = angular.module('myApp', []);

app.controller('adminCtrl', function($scope, $http, $window, $rootScope) {

	// TODO: define base url
	// var BASE_URL = "http://localhost:";

	// TODO: declare user object
	var MAINCATEGORY = {};

	// TODO: default filter
	$scope.filter = {
		page : 1,
		limit : 18
	};

	// TODO:
	$scope.paging = {};

	// TODO:
	var PAGINATION = angular.element('#pagination');

	// TODO: load Pagination
	MAINCATEGORY.loadPagination = function(response) {

		// TODO: Initialize pagination setting
		$scope.paging = {
			totalPages : response.Pagination.TOTAL_PAGES,
			totalRecords : response.Pagination.TOTAL_COUNT,
			currentPage : response.Pagination.PAGE,
			limit : response.Pagination.LIMIT
		};
		// TODO:
		PAGINATION.bootpag({
			total : $scope.paging.totalPages,
			page : $scope.paging.currentPage,
			leaps : true,
			firstLastUse : true,
			first : '←',
			last : '→',
			next : 'Next',
			prev : 'Prev',
			maxVisible : 100
		});
	};

	// TODO: add listener to page click
	PAGINATION.on("page", function(event, pageNumber) {
		$scope.filter.page = pageNumber;
		MAINCATEGORY.selectCategory();
	});

	$scope.$watch('province', function(newValue) {
		$rootScope.subprovinceId = newValue;
	});

	$scope.$watch('district', function(newValue) {
		$rootScope.subdistrictId = newValue;
	});

	$scope.$watch('commune', function(newValue) {
		$rootScope.subcommuneId = newValue;
	});
	
	$scope.$watch('category', function(newValue) {
		$rootScope.subCategoryId = newValue;
	});

	MAINCATEGORY.selectCategory = function() {
		$http({
			url : 'http://localhost:8888/maincategory',
			params : $scope.filter,
			method : 'GET'
		}).then(function(objcat) {
			$scope.myCat = objcat.data.DATA;
			MAINCATEGORY.loadPagination(objcat.data);
		}, function(response) {
			alert("fail");
		});
	}
	
	MAINCATEGORY.selectCategoryNoPagin = function() {
		$http({
			url : 'http://localhost:8888/maincategory',
			method : 'GET'
		}).then(function(response) {
			console.log("COMBO BOX==>",response);
			$scope.myCatNP = response.data.DATA;
		}, function(response) {
			alert("fail");
		});
	}
	MAINCATEGORY.selectCategoryNoPagin();

	// TODO: Reload data again
	MAINCATEGORY.reload = function(filter) {
		$scope.filter = filter;
		MAINCATEGORY.selectCategory();
	};
	MAINCATEGORY.selectCategory();

	$scope.deleteCategory = function(myid) {
		$http({
			url : 'http://localhost:8888/maincategory/' + myid,
			method : 'DELETE'
		}).then(function(objcat) {
			alert("Delete Success ");
			$scope.selectCategory();
		}, function(response) {
			alert('failed');
		})
	}

	$scope.changeMode = function(mode) {
		if (mode == 0) {
			$scope.name = "";
			$scope.img1 = "";
			$scope.img2 = "";
			$scope.t_id = "";
			$("#addCat").show();
			$("#updateCat").hide();
		}
	};
	$scope.addCategory = function() {
		alert("Weloceot add");
		alert($scope.t_id);
		var filename1 = $('#img1').val();
		var filename2 = $('#img2').val();
		if (filename1.substring(3, 11) == 'fakepath') {
			filename1 = filename1.substring(12, filename1.length);
		}
		if (filename2.substring(3, 11) == 'fakepath') {
			filename2 = filename2.substring(12, filename2.length);
		}
		$http({
			url : 'http://localhost:8888/maincategory/',
			method : 'POST',
			data : {
				'name' : $scope.name,
				't_id' : $scope.rest_type,
				'img1' : filename1,
				'img2' : filename2
			}
		}).then(function(response) {

			$scope.selectCategory();
		}, function(response) {
			alert('failed');
		});
	}

	$scope.editCategory = function(newData) {
		$("#addCat").hide();
		$("#updateCat").show();
		console.log(newData);
		$scope.id = newData.c.id;
		$scope.img1 = newData.c.img1;
		$scope.img2 = newData.c.img2;
		$scope.name = newData.c.name;
		$scope.t_id = newData.c.t_id;
	}
	$scope.updateCategory = function() {
		$http({
			url : 'http://localhost:8888/maincategory/',
			method : 'PUT',
			data : {
				'id' : $scope.id,
				'name' : $scope.name,
				'img1' : $scope.img1,
				'img2' : $scope.img2,
				't_id' : $scope.t_id
			}
		}).then(function(response) {
			$scope.selectCategory();
		}, function(response) {
			alert("fail maincateory put");
		});
	}

	/* Start Restaurant Type */

	// GetALL Type of restaurant
	$scope.getRestType = function() {
		$http({
			url : 'http://localhost:8888/resttype',
			method : 'GET'
		}).then(function(response) {
			$scope.myrestType = response.data.DATA;

		}, function(response) {
			alert('failed');
		});
	}
	$scope.getRestType();

	$scope.addRestType = function() {
		$http({
			url : 'http://localhost:8888/resttype/',
			method : 'POST',
			data : {
				'name' : $scope.name
			}
		}).then(function(response) {
			$scope.getRestType();
		}, function(response) {
			alert('failed');
		});
	}

	$scope.deleteRestType = function(id) {
		$http({
			url : 'http://localhost:8888/resttype/' + id,
			method : 'DELETE'
		}).then(function(objcat) {
			$scope.getRestType();
		}, function(response) {
			alert('failed');
		})
	}

	$scope.changeRestType = function(mymode) {
		if (mymode == 1) {
			$scope.name = "";
			$("#add").show();
			$("#update").hide();
		}
	};

	$scope.editRestType = function(mynew) {
		$("#add").hide();
		$("#update").show();
		$scope.id = mynew.rt.id;
		$scope.name = mynew.rt.name;
	}

	$scope.updateRestType = function() {
		$http({
			url : 'http://localhost:8888/resttype/',
			method : 'PUT',
			data : {
				'id' : $scope.id,
				'name' : $scope.name
			}
		}).then(function(response) {
			$scope.getRestType();
		}, function(response) {
			alert("fail");
		});
	}

	/* End Restaurant Type */

	// GetProvince
	$scope.getProvince = function() {
		$http({
			url : 'http://localhost:8888/cities',
			method : 'GET'
		}).then(function(response) {
			$scope.myProvince = response.data.DATA;
		}, function(response) {
			alert('failed To call all data');
		});
	}
	$scope.getProvince();

	// GetDistrict
	$scope.getDistrict = function(province) {
//
//		$scope.filter.province = province.id;

		console.log($scope.filter);
		// $scope.city = $scope.province;
		$http({
			url : 'http://localhost:8888/cities/' + province.id + '/districts',
			method : 'GET'
		}).then(function(response) {

			$scope.myDistrict = response.data.DATA;
		}, function(response) {
			alert('failed To call all data');
		});
	}

	// Getcommune
	$scope.getCommune = function(district) {
//		console.log(district);
//		$scope.filter.district = district.id;

		$http(
				{
					url : 'http://localhost:8888/districts/' + district.id
							+ '/commnunes',
					method : 'GET'
				}).then(function(response) {
			$scope.myCommune = response.data.DATA;
		}, function(response) {
			alert('failed To call all data');
		});
	}
	$scope.communeChange = function(communeforsearch) {
		console.log(communeforsearch);
		$scope.filter.commune = communeforsearch.id;

	}
});

/* Start Resturant Controller */

app.controller('restCtrl',function($scope, $http, $window, $rootScope) {
					// Pagination

					// TODO: declare user object
					var RESTAURANT = {};
					// $scope.nameforsearch= nameforsearch;
					// $scope.categoryforsearch = categoryforsearch;
					// $scope.provinceforsearch = provinceforsearch;
					// $scope.districtforsearch = districtforsearch;
					// $scope.communeforsearch = communeforsearch;
					// TODO: default filter

					// $scope.filter = {
					// page : 1,
					// limit : 12,
					// name : (name) ? name : $scope.nameforsearch,
					// c_id : (category) ? category: $scope.categoryforsearch,
					// province : (province) ? province :
					// $scope.provinceforsearch,
					// district : (district) ? district :
					// $scope.districtforsearch,
					// commune : (commune) ? commune : $scope.communeforsearch
					// };

					$scope.filter = {
						page : 1,
						limit : 12,
						name : (typeof name === "undefined") ? '' : name,
						c_id : (typeof category === "undefined") ? ''
								: category,
						province : (typeof province === "undefined") ? ''
								: province,
						district : (typeof district === "undefined") ? ''
								: district,
						commune : (typeof commune === "undefined") ? ''
								: commune,
					};

					$scope.categoryChange = function(c) {
						console.log(c);
					};

					// TODO:
					$scope.paging = {};

					// TODO:
					var PAGINATION = angular.element('#paginationRest');

					// TODO: load Pagination
					RESTAURANT.loadPagination = function(response) {

						// TODO: Initialize pagination setting
						$scope.paging = {
							totalPages : response.Pagination.TOTAL_PAGES,
							totalRecords : response.Pagination.TOTAL_COUNT,
							currentPage : response.Pagination.PAGE,
							limit : response.Pagination.LIMIT
						};
						// TODO:
						PAGINATION.bootpag({
							total : $scope.paging.totalPages,
							page : $scope.paging.currentPage,
							leaps : true,
							firstLastUse : true,
							first : '←',
							last : '→',
							next : 'Next',
							prev : 'Prev',
							maxVisible : 12
						});
					};

					// TODO: add listener to page click
					PAGINATION.on("page", function(event, pageNumber) {
						$scope.filter.page = pageNumber;
						RESTAURANT.getRest();
					});



					// GetALL
					RESTAURANT.getRest = function() {
						$http({
							url : 'http://localhost:8888/restaurant',
							params : $scope.filter,
							method : 'GET'

						})
								.then(
										function(response) {
											console.log(response);
											$scope.rest = response.data.DATA;
											RESTAURANT
													.loadPagination(response.data);
											// if($scope.rest.length <=0){
											// $window.location.href=("/404");
											// }

										},
										function(response) {
											console.log(response);
											alert('failed To call all data From GEt all Restaurant By search');
										});
					}
					RESTAURANT.getRest();

					$scope.search = function() {
						$scope.filter.name = ($scope.nameforsearch == undefined) ? ''
								: $scope.nameforsearch;
						$scope.filter.c_id = ($scope.categoryforsearch == undefined) ? ''
								: $scope.categoryforsearch.id;
						$scope.filter.province = ($scope.provinceforsearch == undefined) ? ''
								: $scope.provinceforsearch.id;
						$scope.filter.district = ($scope.districtforsearch == undefined) ? ''
								: $scope.districtforsearch.id;
						$scope.filter.commune = ($scope.communeforsearch == undefined) ? ''
								: $scope.communeforsearch.id;

						console.log('Param');
						console.log($scope.filter.name);
						console.log($scope.filter.c_id);
						console.log($scope.filter.province);
						console.log($scope.filter.district);
						console.log($scope.filter.commune);

						$window.location.href = "/search_result?name="
								+ $scope.filter.name + "&category="
								+ $scope.filter.c_id + "&province="
								+ $scope.filter.province + "&district="
								+ $scope.filter.district + "&commune="
								+ $scope.filter.commune;

					}

					// TODO: Reload data again
					$scope.reload = function(filter) {
						$scope.filter = filter;
						RESTAURANT.getRest();
					};
					var images =[];
					var menus =[];
					RESTAURANT.addRestaurant = function() {
						b = true;
						$scope.btnButton = 'Save';
						
						var frmData = new FormData();
						var tel = $('input[name=tel]');

						$.each(tel, function(key, e) {
							frmData.append('telephones', $(e).val());
						});

						//var restaurant_files = angular.element('#img')[0].files;
						for (var i = 0; i < newFiles['img'].length; i++) {
							frmData.append("image", newFiles['img'][i]);
						}

						//var menu_files = angular.element('#menus')[0].files;

						for (var i = 0; i < newFiles['menus'].length; i++) {
							frmData.append("menus", newFiles['menus'][i]);
						}
//						
//						console.log('Name', checkIsDefined($scope.name);
//						console.log('type', checkIsDefined($rootScope.subCategoryId);
//						console.log('description', checkIsDefined($scope.desc);
//						console.log('home', checkIsDefined($scope.home);
//						console.log('street', checkIsDefined($scope.street);
//						console.log('province', ($scope.province == undefined) ? '' : $scope.province.id);
//						console.log('commune', ($scope.district == undefined) ? '' : $scope.district.id);
//						console.log('district', ($scope.commune == undefined) ? '' : $scope.commune.id);
//						console.log('latitude', checkIsDefined($scope.latitude);
//						console.log('longitude', checkIsDefined($scope.longitude);
//						
						

						frmData.append('name',checkIsDefined($scope.name));
						frmData.append('type', checkIsDefined($rootScope.subCategoryId));
						frmData.append('description', checkIsDefined($scope.desc));
						frmData.append('delivery', ($scope.delivery == undefined) ? 'No' : 'Yes'); 
						frmData.append('home', checkIsDefined($scope.home));
						frmData.append('street', checkIsDefined($scope.street));
						frmData.append('province', ($scope.province == undefined) ? '' : $scope.province.id);
						frmData.append('commune',($scope.commune == undefined) ? '' : $scope.commune.id);
						frmData.append('district', ($scope.district == undefined) ? '' : $scope.district.id);
						
						frmData.append('latitude', checkIsDefined($scope.latitude));
						frmData.append('longitude', checkIsDefined($scope.longitude));

						$http({
							url : 'http://localhost:8888/restaurant',
							method : 'POST',
							data : frmData,
							transformRequest : angular.identity,
							headers : {
								'Content-Type' : undefined
							}
						})
								.then(
										function(response) {
											console.log(response.data);
											RESTAURANT.getRest();
										},
										function(error) {
											console.log(error.data);
											alert('failed to upload data! Please Try again Youra !!!!!');
											RESTAURANT.getRest();
										});
					}
					var btnButton = '';
					var title ='';
					$scope.event = function() {
						if (b == true) {
							RESTAURANT.addRestaurant();
						} else {
							console.log("UPDATEME");
							RESTAURANT.updateRestaurant();
						}
					}

					$scope.addButton = function() {
						b = true;
						$scope.btnButton = 'ADD';
						$scope.title = 'Add New Restaurant';
					}
					$scope.getupdateRestauratn = function(rest) {
						
							$("#myprovince").hide();
							$("#mydistrict").hide();
							$("#mycommune").hide();
					
						
						b = false;
						$scope.btnButton = 'UPDATE';
						$scope.title='Update Restaurant Information';
						console.log(rest);
						id = rest.r.id;
						$scope.name = rest.r.name;
						$scope.category = rest.r.sub_id + '';
						$scope.delivery = rest.r.delivery;
						$scope.desc = rest.r.desc;
						$scope.home = rest.r.home;
						$scope.street = rest.r.street;
//						$scope.district = rest.r.district;
//						$scope.commune = rest.r.commune;
						$scope.latitude = rest.r.latitude;
						$scope.longitude = rest.r.longitude;

//						angular.forEach($scope.myProvince, function(item) {
//							if (item.khmer_name === rest.r.province) {
//								$scope.province = item;
//								$scope.getDistrict(item.id);
//								return;
//					}
//						
//					});

//						angular.forEach($scope.myDisctrict, function(item) {
//							if (item.khmer_name === rest.r.disctrict) {
//								$scope.district = item;
//								return;
//							}
//						});
//
//						angular.forEach($scope.myCommune, function(item) {
//							if (item.khmer_name === rest.r.commune) {
//								$scope.commune = item;
//								return;
//							}
//						});
//						
						/********
						                        $scope.sample1 = [
                {
                    id  : 10,
                    name: "1",
                    type: "image/jpg",
                    size: '',
                    file: "http://www.gettyimages.com/gi-resources/images/Homepage/Hero/US/MAR2016/prestige-587705839_full.jpg"
                },
                {
                    id  : 20,
                    name: "2",
                    size: '',
                    type: "image/jpg",
                    file: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQt3XVxyI5sLL8f1_vPQkAxGRBIfYa6e4lESTqVQk3j_JN_O0M6LA"
                }
            ];
					     */
						
						$scope.sampleRest = [];
						$scope.sampleMenu = [];
						 
						$.each(rest.r.images, function(index, item){
							var restImage = {
									id  : item.id,
									name: '',
									type: "image/jpg",
									size: '',
									file: 'http://localhost:8888/' + item.url
							}
							$scope.sampleRest.push(restImage);
						});
						
						$scope.myfun();
						
						$.each(rest.r.menus, function(index, item){
							var menuImage = {
									id  : item.id,
									name: '',
									type: "image/jpg",
									size: '',
									file: 'http://localhost:8888/' + item.url
							}
							$scope.sampleMenu.push(menuImage);
						});
						
						
						$scope.mymenus();
					}
					
					$scope.myfun=function(){
						for(var i in images){
							$scope.sample1 = images[i].url
							console.log("sample1 is are "+$scope.sample1);
							}
					}
					$scope.mymenus=function(){
						for(var i in menus){
							$scope.sample2 =menus[i].url
							console.log("my sample 2 is "+$scope.sample2);
						}
					}			  

					RESTAURANT.updateRestaurant = function() {
						// console.log(id);
						var frmData = new FormData();
						var tel = $('input[name=tel]');

						$.each(tel, function(key, e) {
							console.log(e);
							frmData.append('telephones', $(e).val());
						});
						//var restaurant_files = angular.element('#img')[0].files;
						for (var i = 0; i < newFiles['img'].length; i++) {
							frmData.append("image", newFiles['img'][i]);
						}

						//var menu_files = angular.element('#menus')[0].files;

						for (var i = 0; i < newFiles['menus'].length; i++) {
							frmData.append("menus", newFiles['menus'][i]);
						}

						// deletedImageIDs['img']
						// deletedImagesIDs['menus']
						for (var i = 0; i < deletedImageIDs['img'].length; i++) {
							frmData.append("imageDelete", deletedImageIDs['img'][i]);
						}
						
						for (var i = 0; i < deletedImageIDs['menus'].length; i++) {
							frmData.append("menuDelete", deletedImageIDs['menus'][i]);
						}
						
						
						
						frmData.append('id', id);
						frmData.append('name', $scope.name);
						frmData.append('type', $rootScope.subCategoryId);
						frmData.append('description', $scope.desc);
						frmData.append('delivery', $scope.delivery);
						frmData.append('home', $scope.home);
						frmData.append('street', $scope.street);
//						frmData.append('province', $scope.province.id);
//						frmData.append('district', $scope.district.id);
//						frmData.append('commune', $scope.commune.id);
						frmData.append('latitude', $scope.latitude);
						frmData.append('longitude', $scope.longitude);

						$http({
							url : 'http://localhost:8888/restaurantUpdate',
							method : 'POST',
							data : frmData,
							transformRequest : angular.identity,
							headers : {
								'Content-Type' : undefined
							}
						})
								.then(
										function(response) {
											console.log(response.data);
											RESTAURANT.getRest();
										},
										function(error) {
											console.log(error.data);
											alert('failed to upload data! Please Try again Youra !!!!!');
											$scope.getRest();
										});
					}
				});

app
		.controller(
				'MyAdCtrl',
				function($scope, $http, $window, $rootScope) {
					// GetRestaurant By ID

					$scope.getRestByID = function(id) {
						$http({
							url : 'http://localhost:8888/restaurant/' + id,
							method : 'GET',
						}).then(function(response) {
							console.log(response);
							$scope.restByID = response.data.DATA;
							init_map($scope.restByID[0].latitude, $scope.restByID[0].longitude,$scope.restByID[0].name,$scope.restByID[0].province,$scope.restByID[0].street);

						}, function(response) {
							console.log(response);
							alert('failed To call all data');
						});
					}
					$scope.getRestByID(rest_id);
//					
//						var latitude=1;
//						
//						latitude.push(1);
//						var longitude2;
//						longitude.push(2);
//						console.log("Lan"+latitude);
//						
					
				});

/* ENd Restuarant Controller */

app.controller('MyCatCtrl', function($scope, $http, $window, $rootScope) {
	// GetRestaurant By ID
	// getRestaurantByCategory(Cate ID)

	// TODO: declare user object
	var RESTAURANT = {};

	// TODO: default filter
	$scope.filter = {
		page : 1,
		limit : 12
	};

	// TODO:
	$scope.paging = {};

	// TODO:
	var PAGINATION = angular.element('#paginationbyCategory');

	// TODO: load Pagination
	RESTAURANT.loadPagination = function(response) {

		// TODO: Initialize pagination setting
		$scope.paging = {
			totalPages : response.Pagination.TOTAL_PAGES,
			totalRecords : response.Pagination.TOTAL_COUNT,
			currentPage : response.Pagination.PAGE,
			limit : response.Pagination.LIMIT
		};
		// TODO:
		PAGINATION.bootpag({
			total : $scope.paging.totalPages,
			page : $scope.paging.currentPage,
			leaps : true,
			firstLastUse : true,
			first : '←',
			last : '→',
			next : 'Next',
			prev : 'Prev',
			maxVisible : 12
		});
	};

	// TODO: add listener to page click
	PAGINATION.on("page", function(event, pageNumber) {
		$scope.filter.page = pageNumber;
		RESTAURANT.getRest();
	});

	RESTAURANT.getRestaurantByCategory = function(cat_id) {
		$http({
			url : 'http://localhost:8888/restaurant/category/' + cat_id,
			params : $scope.filter,
			method : 'GET'
		}).then(function(response) {
			console.log(response);
			$scope.MyCategories = response.data.DATA;
			RESTAURANT.loadPagination(response.data);
			if ($scope.MyCategories.length <= 0) {
				$window.location.href = ("/404");
			}

		}, function(response) {
			console.log(response);
		});
	}

	// TODO: Reload data again
	$scope.reload = function(filter) {
		$scope.filter = filter;
		RESTAURANT.getRestaurantByCategory(cat_id);
	};
	RESTAURANT.getRestaurantByCategory(cat_id);
});

app.controller('MyTypeCtrl', function($scope, $http, $window, $rootScope) {
	// getRestaurantByType(Type ID)
	RESTAURANT.getRestaurantByType = function(type_id) {
		$http({
			url : 'http://localhost:8888/restaurant/type/' + type_id,
			params : $scope.filter,
			method : 'GET'
		}).then(function(response) {
			console.log(response);
			$scope.MyRestType = response.data.DATA;
			RESTAURANT.loadPagination(response.data);

			if ($scope.MyRestType.length <= 0) {
				$scope.getNotFound();
			}

		}, function(response) {
			console.log(response);
			/* alert('failed To call Restaurant Type'); */
		});
	}
	// TODO: Reload data again
	$scope.reload = function(filter) {
		$scope.filter = filter;
		RESTAURANT.getRestaurantByType(type_id);
	};
	RESTAURANT.getRestaurantByType(type_id);

});
//
// GET rest By ID

//app.directive('myFilter', [function() {
//    return {
//        restrict: 'A',       
//        link: function(scope, element) {
//            // wait for the last item in the ng-repeat then call init
//            angular.element(document).ready(function() {
//                initJqueryFiler(['#img','#menus'], [[],[]]);
//            });
//            // OR use $braodcast & $on in Controller
//        }
//    };
//    /**** Usable array ****/
//    // If your input file, id = '#gallery' use:
//    // => newFiles['gallery']
//    // => deletedImageIDs['gallery']
//
//}]);

//				add and update
				app.directive('myFilter', [function() {
				return {
				  restrict: 'A',       
				  link: function(scope, element) {
				      // wait for the last item in the ng-repeat then call init
				      angular.element(document).ready(function() {
				          initJqueryFiler(['#img','#menus'], [[],[]]);
				      });
				      // OR use $braodcast & $on in Controller
				  }
				};
				/**** Usable array ****/
				// If your input file, id = '#gallery' use:
				// => newFiles['gallery']
				// => deletedImageIDs['gallery']
				
				}]);
				
				app.directive('filerInit', [function() {
					return {
					  restrict: 'A',       
					  link: function(scope, element) {
					      // wait for the last item in the ng-repeat then call init
					      if (scope.$last){
					    	    $('div.jFiler.jFiler-theme-dragdropbox').remove();
					    		$('#restSampleInit > span:last-child').after('<input type="file" name="files[]" id="img" multiple="multiple">');
					    		$('#menuSampleInit > span:last-child').after('<input type="file" name="files[]" id="menus" multiple="multiple">');
					    	   initJqueryFiler(['#img','#menus'], [scope.sampleRest, scope.sampleMenu]);
					      }
					      // OR use $braodcast & $on in Controller
					  }
					};
				}]);

$(".filer-fancybox").fancybox({
    padding: 0,

    openEffect : 'elastic',
    openSpeed  : 150,

    closeEffect : 'elastic',
    closeSpeed  : 150,

    closeClick : true,

    helpers : {
        overlay : null
    }
});

// Clear Sample Uploaded Image Item
$('#myModal1').on('hidden.bs.modal', function () {
	$('div.jFiler.jFiler-theme-dragdropbox').remove();
	$('#restSampleInit > span:last-child').after('<input type="file" name="files[]" id="img" multiple="multiple">');
	$('#menuSampleInit > span:last-child').after('<input type="file" name="files[]" id="menus" multiple="multiple">');
	initJqueryFiler(['#img','#menus'], [[],[]]);
});





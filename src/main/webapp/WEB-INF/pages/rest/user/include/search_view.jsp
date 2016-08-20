


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container bg-info" id="search">
<div class="col-md-2 col-sm-2 col-xs-3" style="float:left">
	<a href="/">
		<img class="img-responsive" style="padding:10px;" src="${pageContext.request.contextPath}/resources/upload/playlist/img/freshologo.png"/>
	</a>
	</div>
<div class="col-md-10"  ng-controller="adminCtrl" style="margin-top:30px;" >
 	<div class="col-md-8">
            <form class="navbar-search" role="search">
                <div class="input-group">
        
                    <input type="text" class="form-control">
                
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-search btn-success">
                            <span class="glyphicon glyphicon-search"></span>
                            <span class="label-icon">Search</span>
                        </button>
                        <button type="button" id="listcategory" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu pull-right" role="menu" id="mylistcategory">
                          <li ng-repeat="c in myCat">
                                <a href="">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="label-icon">{{c.name}}</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>  
            </form>   
        
</div>
  <div class="col-md-4" style="margin-top:0px; float:right;"> 
 <div class="input-group col-md-12 col-sm-12 col-xs-12">
                <input type="button" class="form-control" id="location"  value="Phnom Penh, Tul Kork"/>
                <div class="input-group-btn">
                    <div class="btn-group" role="group">
                        <div class="dropdown dropdown-lg">
                           
                            <div class="dropdown-menu dropdown-menu-right" role="menu" id="mylocation">
                                <form class="form-horizontal" role="form">
                                  <div class="form-group">
                                    <label for="filter">Filter by</label> <select class="form-control"
											name="province" id="type" ng-model="province"
											ng-change="getDistrict(province.id)"
											ng-options="p as p.khmer_name for p in myProvince track by p.id">

											<option value="" style="display: none">-- Please
												Select City or Province --</option>

										</select> <select class="form-control" name="district"
											id="type" ng-model="district"
											ng-change="getCommune(district.id)"
											ng-options="d as d.khmer_name for d in myDistrict track by d.id">
											<option value="" style="display: none">-- Please
												Select District --</option>
										</select> <select class="form-control" name="commune"
											id="type" ng-model="commune"
											ng-options="c as c.khmer_name for c in myCommune track by c.id">

											<option value="" style="display: none">-- Please
												Select Commune --</option>

										</select>
									</div>
                                   <div class="form-group">
                                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"> &nbspAuto search youra location here</span></button>
                                  </div>
                                </form>
                            </div>
                        </div>
                        <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-map-marker" aria-hidden="false"></span></button>
                    </div>
                </div>
            </div>
 
  </div>
  <br><br>
            Type : &nbsp <a  ng-repeat="r in myrestType" style="font-size:12px;" href="/typerestaurant/{{r.id}}">{{r.name}}</a>
</div>
</div>
		

  <div id="out" style="display:none"></div>
<script>

$(document).ready(function() {

	$("#location").click(function(){
		$("#mylocation").toggle();
	});
	$("#listcategory").click(function(){
		$("#mylistcategory").toggle();
	});


});


	function geoFindMe() {
		var output = document.getElementById("out");

		if (!navigator.geolocation) {
			output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
			return;
		}

		function success(position) {
			var latitude = position.coords.latitude;
			var longitude = position.coords.longitude;

			output.innerHTML = '<p>Latitude is ' + latitude
					+ '° <br>Longitude is ' + longitude + '°</p>';

			var img = new Image();
			img.src = "https://maps.googleapis.com/maps/api/staticmap?center="
					+ latitude + "," + longitude
					+ "&zoom=13&size=300x300&sensor=false";

			output.appendChild(img);
		}
		;

		function error() {
			output.innerHTML = "Unable to retrieve your location";
		}
		;

		output.innerHTML = "<p>Locating…</p>";

		navigator.geolocation.getCurrentPosition(success, error);
	}
	
	 
	$(function(){
	    
	    $(".input-group-btn .dropdown-menu li a").click(function(){

	        var selText = $(this).html();
	    
	        //working version - for single button //
	       //$('.btn:first-child').html(selText+'<span class="caret"></span>');  
	       
	       //working version - for multiple buttons //
	       $(this).parents('.input-group-btn').find('.btn-search').html(selText);

	   });

	});

	
</script>


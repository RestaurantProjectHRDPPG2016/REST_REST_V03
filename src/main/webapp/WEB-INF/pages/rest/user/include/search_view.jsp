


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container bg-info" id="search">
<div class="row">
<div class="col-md-2 col-sm-2 col-xs-3" style="float:left">
	<a href="/">
		<img class="img-responsive" style="padding:10px;" src="${pageContext.request.contextPath}/resources/upload/playlist/img/freshologo.png"/>
	</a>
	</div>
	 
<div class="col-md-10"  ng-controller="adminCtrl" style="margin-top:30px;" >
  <form class="navbar-search" role="search">
 	<div class="col-md-8">
         
            <span ng-controller='restCtrl'>
                <div class="input-group">
                    <input type="text" class="form-control" ng-model="nameforsearch" >
                
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-search btn-success" ng-click="search(); $event.stopPropagation();">
                            <span class="glyphicon glyphicon-search"></span>
                            <span class="label-icon">Search</span>
                        </button>
                        <button type="button" class="btn btn-success dropdown-toggle" >
                          <select
											name="categoryforsearch" id="categoryforsearch" ng-model="categoryforsearch"
											ng-change = "categoryChange(categoryforsearch)"
											ng-options="c as c.name for c in myCatNP track by c.id">
											<option value="" style="display: none"> Category </option>

						</select>
                        </button>
                    </div>
                 
                </div>  
                </span>
           
        
</div>
  <div class="col-md-4" style="margin-top:0px; float:right;"> 
 <div class="input-group col-md-12 col-sm-12 col-xs-12">
                <input type="button" class="form-control" id="location"  value="Phnom Penh, Tul Kork"/>
                <div class="input-group-btn">
              
                    <div class="btn-group" role="group">
                        <div class="dropdown dropdown-lg">
                           
                            <div class="dropdown-menu dropdown-menu-right" role="menu" id="mylocation">
                               
                                  <div class="form-group">
                                    <label for="filter">Filter by</label> 
                                    <select class="form-control"
											name="provinceforsearch" id="provinceforsearch" ng-model="provinceforsearch"
											ng-change="getDistrict(provinceforsearch)"
											ng-options="p as p.khmer_name for p in myProvince track by p.id">

											<option value="" style="display: none"> City or Province </option>

										</select> 
										</div>
										
										<br>
										 <div class="form-group">
										<select class="form-control" name="districtforsearch"
											id="districtforsearch" ng-model="districtforsearch"
											ng-change="getCommune(districtforsearch)"
											ng-options="d as d.khmer_name for d in myDistrict track by d.id">
											<option value="" style="display: none"> District </option>
										</select> 
										</div>
										<br>
										 <div class="form-group">
										<select class="form-control" name="communeforsearch"
											id="communeforsearch" ng-model="communeforsearch"
											ng-change= "communeChange(communeforsearch)"
											ng-options="c as c.khmer_name for c in myCommune track by c.id">

											<option value="" style="display: none"> Commune </option>

										</select>
									</div>
									<br>
									<div style="clear: both;"></div>
                                 <div class="form-group">
                                    <button type="submit" class="btn btn-default btn-sm">
                                    	<span class="glyphicon glyphicon-map-marker" aria-hidden="true">Auto search youra location here</span>
                                    </button>
                                  </div> 
                            
                            </div>
                        </div>
                        <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-map-marker" aria-hidden="false"></span></button>
                    </div>
                </div>
            </div>
    </form>  
  </div>
  <br><br>
            Type : &nbsp <a  ng-repeat="r in myrestType" style="font-size:12px;" href="/typerestaurant/{{r.id}}">{{r.name}}</a>

</div>

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
					+ '<br>Longitude is ' + longitude + '°</p>';

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

	nameforsearch ="${nameforsearch}";
	categoryforsearch ="${categoryforsearch}";
	provinceforsearch ="${provinceforsearch}";
	districtforsearch ="${districtforsearch}";
	communeforsearch ="${communeforsearch}";
	
	
</script>


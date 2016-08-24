<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container margintop5">
<div class="row panel-group">
	<div class="panel panel-info">
	<div class="panel-heading">ផែនទី</div>
	<div class="panel-body">

<script
	src='https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyAyC68lp95UX4v5CwpaiAaHrfcjLWqE6-8'></script>
<div style='overflow: hidden; height: 400px; width: 100%;'>
	<div id='gmap_canvas' style='height: 400px; width: 100%;'></div>
	<style>
#gmap_canvas img {
	max-width: none !important;
	background: none !important
}
</style>
</div>
<a href='https://embedmaps.org/'>embedding a google map</a>
<script type='text/javascript'
	src='https://embedmaps.com/google-maps-authorization/script.js?id=e42d15d3ac86099fdc2aea26f3228eea98aeab26'></script>
<script type='text/javascript'>

	function init_map(latitude, longitude,name,street,province) {
		var myOptions = {
			zoom : 16,
			center : new google.maps.LatLng(latitude, longitude),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('gmap_canvas'),
				myOptions);
		marker = new google.maps.Marker({
			map : map,
			position : new google.maps.LatLng(latitude, longitude)
		});
		infowindow = new google.maps.InfoWindow(
				{
					content : '<strong>'+name+'</strong><br>'+street+'<br>'+province
				});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
		infowindow.open(map, marker);
	}
</script>
	</div>
	</div>
	</div>
	</div>
	
<div class="container">
<div class="row panel-group">
	<div class="panel panel-info">
	<div class="panel-heading">ព័ណមានបន្ថែម​ និង រូបភាព</div>
	<div class="panel-body" ng-controller="MyAdCtrl">

			<div ng-repeat="r in restByID"> 
			<div class="col-md-3">
			<div class="col-md-12" style="border:solid 1px #dddddd; border-radius:5px;">
			    <p style="margin-top: 10px;text-transform: uppercase; color: red; text-align:center;"">
			    &nbsp {{r.name}} </p>
                <p><span>House Number : </span> {{r.home}} </p>
                <p> Street : {{r.street}} </p>
                <p>សង្កាត់ : {{r.commune}} </p>
                <p>ខ័ណ្ឌ : {{r.district}} </p>
                <p>ទីក្រុង : {{r.province}} </p>
                <p><span ng-repeat="t in r.tel"> ទូរស័ព្ទ : {{t.tel}} | </span></p>
               </div>
               </div>
          <div class="col-md-9">
			  <div class="col-md-4" ng-repeat="image in r.images | limitTo : 3">
				    <img class="thumbnail example-image-link img-responsive" 
				    src="http://localhost:8888/{{image.url}}"/>
			 </div>
			 </div>
			</div>
	</div>
	</div>
	</div>
	</div>


<script>
		rest_id = "${id}";
</script> 
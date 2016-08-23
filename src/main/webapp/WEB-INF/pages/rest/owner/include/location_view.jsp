<div class="container" style="padding:0px; margin-top:5px; margin-bottom:5px; border-radius:5px;">

	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding: 0px; background-color: #dddddd; border-right: 1px white solid;">
		<div ng-controller="MyAdCtrl">

			<div ng-repeat="r in restByID"> 
			    <p style="margin-top: 10px;text-transform: uppercase; color: red;">
			    
			    
			        <span ng-repeat="image in r.images | limitTo : 1">
				    <center><img class="img-circle img-responsive" 
				    src="http://localhost:8888/{{image.url}}"/>
				    </center>
			  </span>
			    
			    &nbsp {{r.name}} </p>
                <p><span>&nbsp # </span> {{r.home}} , St {{r.street}} , {{r.commune}} , {{r.district}} , {{r.province}} </p>
                <p><span ng-repeat="t in r.tel"> &nbsp {{t.tel}} | </span></p>
                <hr>
                <section>  
			    <span ng-repeat="image in r.images | limitTo : 1">
				    <center><img class="thumbnail example-image-link img-responsive" 
				    src="http://localhost:8888/{{image.url}}"/>
				    </center>
			  </span>
			  </section>
			</div>
		</div>
	</div>
	<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12" style="padding: 0px;">		
	
		<!-- //map -->

<script
	src='https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyAyC68lp95UX4v5CwpaiAaHrfcjLWqE6-8'></script>
<div style='overflow: hidden; height: 600px; width: 100%;'>
	<div id='gmap_canvas' style='height: 600px; width: 100%;'></div>
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
	//google.maps.event.addDomListener(window, 'load', init_map);
</script>
	</div>
  </div>


<script>
		rest_id = "${id}";
</script> 
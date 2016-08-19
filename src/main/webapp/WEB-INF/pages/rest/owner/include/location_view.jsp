<div class="container" style="padding:0px; margin-top:5px; margin-bottom:5px;">
  <div style=" margin-top: 2px; margin-bottom: 5px;">
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding: 0px; background-color: #dddddd; border-right: 3px white solid;">
		<div ng-controller="MyAdCtrl">
			<div class="input-group" style="padding: 5px;">
		      <input type="text" class="form-control" placeholder="Restaurant name...">
		      <span class="input-group-btn">
		        <button class="btn btn-primary" type="button"><span class="glyphicon glyphicon-search"></span></button>
		      </span>
		    </div>
		    <div class="checkbox">
			      <label><input type="checkbox" value="rest"> Near by restaurant</label>
			    </div>
			<div ng-repeat="r in restByID"> 
			    <p style="margin-top: 10px;text-transform: uppercase; color: red;">&nbsp {{r.name}} </p>
                <p><span>&nbsp # </span> {{r.home}} , St {{r.street}} , {{r.commune}} , {{r.district}} , {{r.province}} </p>
                <p><span ng-repeat="t in r.tel"> &nbsp {{t.tel}} | </span></p>
                <hr>
                <section>  
			    <span ng-repeat="image in r.images">
				    <center><img class="thumbnail example-image-link img-responsive"  style=" width: 350px; height: 350px; "
				    src="${pageContext.request.contextPath}/resources/upload/owner/img/1111.jpg"/>
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
<div style='overflow: hidden; height: 400px; width: 520px;'>
	<div id='gmap_canvas' style='height: 400px; width: 520px;'></div>
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
	function init_map() {
		var myOptions = {
			zoom : 16,
			center : new google.maps.LatLng(11.576680820313506,
					104.89330349671172),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('gmap_canvas'),
				myOptions);
		marker = new google.maps.Marker({
			map : map,
			position : new google.maps.LatLng(11.576680820313506,
					104.89330349671172)
		});
		infowindow = new google.maps.InfoWindow(
				{
					content : '<strong>Youra Houwse</strong><br>3333<br> Phnom Penh <br><br><img src="IMG_4728.JPG" style="width:20px;"/>'
				});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
		infowindow.open(map, marker);
	}
	google.maps.event.addDomListener(window, 'load', init_map);
</script>
	
		
		<!-- <div class="google-maps">
		    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7098.94326104394!2d78.0430654485247!3d27.172909818538997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1385710909804" 
		    width="1170" height="100" frameborder="0" style="border:0"></iframe>
		</div> -->
	</div>
  </div>
</div>


<script>
		rest_id = "${id}";
</script> 
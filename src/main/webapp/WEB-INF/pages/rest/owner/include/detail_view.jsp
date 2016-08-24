
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owner/lightbox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owner/lightbox.css">

<script
	src="${pageContext.request.contextPath}/resources/script/owner/lightbox-plus-jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/owner/photo-gallery.js"
	type="text/javascript"></script>
<!-- detail -->
<div class="container" id="catdetail" style="border:solid 1px #dddddd; border-radius:5px; margin-top:10px;">
  <div ng-controller="MyAdCtrl">
	<div ng-repeat="r in restByID"> 
        <div class="col-md-5">
	        <section>  
			    <span ng-repeat="image in r.images">
				   <a class="example-image-link img-responsive" style="text-align:center; width: 300px; height: 300px; margin-bottom: 20px;" href="http://localhost:8888{{image.url}}" 
				     data-lightbox="example-set">
 				   <!--  <img class="example-image" src="http://localhost:8888/{{image.url}}" alt="" /></a> -->
 				   <img class="example-image" src="http://localhost:8888{{image.url}}" alt="" /></a> 
			  </span>
			  </section>
          </div>  
          
          <!-- hdjc -->
          <div class="col-md-7" style="border: 5px #dddddd dashed; margin-top: 5px; margin-bottom: 5px;">
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			    <p class="thumbnail"  style="text-align: center;margin-top: 15px; font-size: 24px; font-weight: bold;text-transform: uppercase;background-color: #dddddd;">
			     {{r.name}}
			    </p>
              <div>
              <table class="table" style="border-top: 0px;">
              <tr>
                <td><b>Description: </b></td>
                <td>{{r.desc}}</td>
              </tr>
              <tr>
                <td><b>Address: </b></td>
                <td> <span> # </span>{{r.home}} , St {{r.street}} , {{r.commune}} , {{r.district}} , {{r.province}} </td>
              </tr>
              <tr>
                <td><b>Contact: </b></td>
                <td><span ng-repeat="t in r.tel">{{t.tel}} | </span></td>
              </tr>
              <tr>
                <td><b>Delivery: </b></td>
                <td>{{r.delivery}} </span></td>
              </tr>
              <tr>
              	<td></td>
              	<td><div style="margin-top:10px;">
					<span class="btn btn-sm btn-primary">Like</span>
					<a href="/locations/{{r.id}}"><span class="btn btn-default btn-sm" >Visit Map</span></a>
				</div></td>
              </tr>
              </table>
              </div>
          </div>
         </div>
         </div>   
       </div>     
    </div> <!-- /container -->
    

<script src="resources/script/owner/lightbox-plus-jquery.min.js"></script>
<script src="resources/script/owner/lightbox.min.js"></script>
<script src="resources/script/owner/lightbox.js"></script>

<!-- 
detaile -->


<script>
		rest_id = "${id}";
</script> 
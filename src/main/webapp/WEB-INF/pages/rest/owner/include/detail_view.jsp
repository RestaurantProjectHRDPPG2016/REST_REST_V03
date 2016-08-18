<!-- detail -->
<div class="container" id="catdetail" style="border:solid 1px #dddddd; border-radius:5px; margin-top:10px;">
  <div ng-controller="MyAdCtrl">
	<div ng-repeat="r in restByID"> 
        <div class="col-md-5">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	        <section>  
			    <span ng-repeat="image in r.images">
			       <!-- <a class="example-image-link" href="http://localhost:8888/{{image.url}}" 
				     data-lightbox="example-set"> -->
				<a class="example-image-link img-responsive" style="width: 300px; height: 300px; margin-bottom: 20px;" href="${pageContext.request.contextPath}/resources/upload/playlist/img/1-1.png" 
				     data-lightbox="example-set">
 				   <!--  <img class="example-image" src="http://localhost:8888/{{image.url}}" alt="" /></a> -->
 				   <img class="example-image" src="${pageContext.request.contextPath}/resources/upload/playlist/img/1-1.png" alt="" /></a> 
			  </span>
			  </section>
		  </div>
          </div>  
          
          <!-- hdjc -->
          <div class="col-md-7">
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
              <h2 style="text-align: center;">{{r.name}}</h2>
              <div class="table-responsive">
              <table class="table" style="border-top: 0px;">
              <tr>
                <td>Description: </td>
                <td>{{r.desc}}</td>
              </tr>
              <tr>
                <td>Address</td>
                <td>{{r.home}},{{r.street}}</td>
              </tr>
              <tr>
                <td>Contact</td>
                <td><span ng-repeat="t in r.tel">{{t.tel}} | </span></td>
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

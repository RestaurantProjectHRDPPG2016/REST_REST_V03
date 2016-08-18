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
		<div class="google-maps">
		    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7098.94326104394!2d78.0430654485247!3d27.172909818538997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1385710909804" 
		    width="1170" height="100" frameborder="0" style="border:0"></iframe>
		</div>
	</div>
  </div>
</div>


<script>
		rest_id = "${id}";
</script> 
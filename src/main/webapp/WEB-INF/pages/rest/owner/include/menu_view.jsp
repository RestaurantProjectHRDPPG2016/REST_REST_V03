	<div class="container" style="background-color:#DDDDDD;margin-bottom:10px;padding:0px;margin-top:10px;">
 		<div class="col-lg-12 col-md-12  col-sm-12 col-xs-12" style="padding:0px;"  ng-controller="MyCatCtrl">
 			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="padding:0px;" ng-repeat="cat in MyCategories">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:2px;">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 hlist">
						<div class="col-md-4" style="margin-top:50px;">
						<div style="float:left; width: 100px; height:auto;">
							<span ng-repeat="img in cat.url">
							 <img class="img-responsive" src="http://localhost:8888/${pageContext.request.contextPath}/{{img.images[0].url}}" alt="Food"> 
							</span>
						</div>
						</div>
						<div class="col-md-8">
							<div style="float:left;">
								<a href="/detail/{{cat.id}}">
									<div><span  style="font-size:20px; font-weight: bolder;">{{cat.name}}</span></div>
									<div><span style="font-size:12px;">{{cat.home}} St {{cat.street}} {{cat.commune}}</span></div>
									<div><span style="font-size:12px;">{{cat.district}} {{cat.city}}</span></div>
									<!-- <div><span style="font-size:12px;">Knowing that items is a JSON container received through a request, so that's why I'm using a key, value method.{{r.city}}</span></div> -->
									<div ng-repeat="tele in cat.tel | limitTo:1"><span style="font-size:12px;">Tel: {{tele.tel[0].tel}}</span></div>
									<div><span><b style="color:red;">Opens: 10:00 AM - 11:00 PM</b></span></div>
									<div style="margin-bottom:10px;">
										<span class="sbtn">Like</span>
										<a href="/locations"><span class="btn btn-default" >Visit Map</span></a>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>

<script>
	cat_id = "${id}";
</script>


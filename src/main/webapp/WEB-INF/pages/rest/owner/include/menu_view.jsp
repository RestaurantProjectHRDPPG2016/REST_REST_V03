	<div class="container" style="margin-bottom:5px;padding:0px;margin-top:5px;">
 		<div class="col-lg-12 col-md-12  col-sm-12 col-xs-12" style="padding:0px;"  ng-controller="MyCatCtrl">
 			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="padding:0px;" ng-repeat="cat in MyCategories">
				<div class="col-lg-12 col-offset-1 col-md-12 col-sm-12 col-xs-12" style="padding:2px;background-color:#DDDDDD;">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 hlist" style="padding: 0px;">
					<a href="/detail/{{cat.id}}">
					<div><span  style="font-size:20px;font-weight: bolder;"><center>{{cat.name}}</center></span></div>
						<div class="col-md-4" style="margin-top:5px;">
						<div style="float:left; width: 200px; height:auto;">
							<!-- <span ng-repeat="img in cat.url"> -->
							<img class="img-responsive" style="width: 100px; height: 100px;" src="${pageContext.request.contextPath}/resources/upload/playlist/img/1-1.png"/>
							 <%-- <img class="img-responsive" src="http://localhost:8888/${pageContext.request.contextPath}/{{img.images[0].url}}" alt="Food">  --%>
							<!-- </span> -->
				</div>
						</div>
						<div class="col-md-8">
							<div style="float:left;">
								
									<!-- <div><span  style="font-size:20px; font-weight: bolder;">{{cat.name}}</span></div> -->
									<div><span style="font-size:13px;">{{cat.home}} St {{cat.street}} {{cat.commune}}</span></div>
									<div><span style="font-size:13px;">{{cat.district}} {{cat.city}}</span></div>
									<!-- <div><span style="font-size:13px;">Knowing that items is a JSON container received through a request, so that's why I'm using a key, value method.{{r.city}}</span></div> -->
									<div ng-repeat="tele in cat.tel | limitTo:1"><span style="font-size:13px;">Tel: {{tele.tel}}</span></div>
									<div><span><b style="color:red;">Opens: 10:00 AM - 11:00 PM</b></span></div>
									<div style="margin-bottom:10px;">
										<span class="sbtn">Like</span>
										<a href="/locations"><span class="btn btn-default btn-xs" >Visit Map</span></a>
									</div>
							
							</div>
						</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div id="pagination">
	</div>
</div>

<script>
	cat_id = "${id}";
</script>


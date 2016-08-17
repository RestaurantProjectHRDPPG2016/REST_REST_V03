	<div class="container" style="background-color:#DDDDDD;margin-bottom:10px;padding:0px;margin-top:10px;" ng-controller="restCtrl">
 		<div class="col-lg-12 col-md-12  col-sm-12 col-xs-12" style="padding:0px;">
 			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="padding:0px;" ng-repeat="r in rest">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:2px;">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 hlist">
						<div class="col-md-4" style="margin-top:50px;">
						<div style="float:left; width: 100px; height:auto;">
							<img class="img-responsive" src="http://localhost:8888/{{r.images[0].url}}" alt="Food">
						</div>
						</div>
						<div class="col-md-8">
							<div style="float:left;">
								<a href="/detail/{{r.id}}">
									<div><span  style="font-size:20px; font-weight: bolder;">{{r.name}}</span></div>
									<div><span style="font-size:12px;">{{r.home}} St {{r.street}} {{r.commune}}</span></div>
									<div><span style="font-size:12px;">{{r.district}} {{r.city}}</span></div>
									<!-- <div><span style="font-size:12px;">Knowing that items is a JSON container received through a request, so that's why I'm using a key, value method.{{r.city}}</span></div> -->
									<div ng-repeat="r in rest | limitTo:1"><span style="font-size:12px;">Tel: {{r.tel[0].tel}}</span></div>
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
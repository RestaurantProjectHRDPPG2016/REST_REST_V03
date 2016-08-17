
<div class="container" id="img-cat" ng-controller="adminCtrl">
	<div class="col-md-12">
	<div ng-repeat="c in myCat">
		<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6">
			<div class="default">
		 	<a href="/owner">
				<img class="img-responsive img-circle" src="resources/upload/playlist/img/{{c.img1}}">
				<span style="position:relative; top:-100px; left:45px; background-color:rgba(0,0,0,0.6);
	color:#ffffff;padding:5px; border-radius:3px;">{{c.name}}</span>
				</a>
			</div>  
	<div class="cover">
			<a href="/owner/{{c.id}}">
				<img class="img-responsive img-circle" src="resources/upload/playlist/img/{{c.img2}}">
				</a>
			</div>
		</div>
		</div>
	</div>
	<div id="pagination">
	</div>
</div>
<!-- heloo -->
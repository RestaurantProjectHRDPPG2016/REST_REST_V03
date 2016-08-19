 <!-- Start Restaurant Category -->
<div class="container" style=" padding: 0px;" id="mynavbar" ng-controller="adminCtrl">
	<div class="navbar-header">
	   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#div0">
	        <span class="glyphicon glyphicon-th-large"></span>
	     </button>
	</div>
	<div>
		<div class="collapse navbar-collapse mycontain" >
		
			<div class="thumbnail item"  ng-repeat="c in myCat">
				<a href="/owner/{{c.id}}">
					<img  src="${pageContext.request.contextPath}/resources/upload/playlist/img/{{c.img1}}" >
					    <span class="caption">{{c.name}}</span>
				</a>
	     	</div>
	  	</div>
	</div>
</div>
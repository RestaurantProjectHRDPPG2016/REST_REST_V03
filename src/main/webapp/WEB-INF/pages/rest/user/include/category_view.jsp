<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container margintop5" id="img-cat" ng-controller="adminCtrl">
	<div class="row panel-group">
	<div class="panel panel-info">
	<div class="panel-heading">ប្រភេទ</div>
	<div class="panel-body">
	<div ng-repeat="c in myCat">
		<div class="col-lg-2 col-md-2 col-sm-4 col-xs-6">
			<div class="default">
		 	<a href="/owner/{{c.id}}">
				<img class="img-responsive img-circle" src="resources/upload/playlist/img/{{c.img1}}">
						<span style="position:absolute; top:70px; left:58px; background-color:rgba(0,0,0,0.6);
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
		</div>
	</div>
	<div id="pagination">
	</div>
</div>
<!-- heloo -->
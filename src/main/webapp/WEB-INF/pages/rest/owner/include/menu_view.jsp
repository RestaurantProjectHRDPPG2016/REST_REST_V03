<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container" style="margin-top:5px;">

<div class="row panel-group">
	<div class="panel panel-info">
	<div class="panel-heading">ភោជនីយដ្ឋានដែលនៅជិតលោកអ្នកបំផុត</div>
	<div class="panel-body">
	<div class="panel=body" ng-controller="MyCatCtrl">
		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12"
			ng-repeat="cat in MyCategories">
			<div class="col-md-12"  style="border:solid 1px #dddddd; 
		padding:5px; margin-top:5px; margin-bottom:5px;">
			<a href="/detail/{{cat.id}}">
				<div class="col-md-4" style="margin-top: 5px;">
					<div style="float: left; width: 200px; height: auto;">
						<span ng-repeat="img in cat.images | limitTo: 1"> <img
							class="img-responsive img-thumbnail" style="width: 100px; height: 100px;"
							src="http://localhost:8888{{img.url}}" />
						</span>
					</div>
				</div>
			</a>

			<div class="col-md-8">
				<div>
				<a href="/detail/{{cat.id}}">
						<p style="white-space: nowrap;width: 100%;overflow: hidden;text-overflow: ellipsis;">
					<span style="font-size: 14px; font-weight: bolder;">{{cat.name}}</span>
					</p>
				</div>
				<div>
					
						<div>
							<span style="font-size: 13px;">{{cat.home}} St
								{{cat.street}} {{cat.commune}}</span>
						</div>
						<div>
							<span style="font-size: 13px;">{{cat.district}}
								{{cat.city}}</span>
						</div> <!-- <div><span style="font-size:13px;">Knowing that items is a JSON container received through a request, so that's why I'm using a key, value method.{{r.city}}</span></div> -->
						<div ng-repeat="tele in cat.tel | limitTo:1">
							<span style="font-size: 13px;">Tel: {{tele.tel}}</span>
						</div>
					</a>
					<div style="margin-bottom: 10px;">
<!-- 						<iframe
							src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fkplous%2F&width=450&layout=standard&action=like&size=small&show_faces=false&share=false&height=35&appId=1489855064642155"
							width="450" height="35" style="border: none; overflow: hidden"
							scrolling="no" frameborder="0" allowTransparency="true"></iframe> -->
						<!-- <a href="/locations/{{r.id}}"><span class="btn btn-default btn-sm">Visit
								Map</span></a> -->
					</div>
				</div>
				</div>
				</div>
				</div>
				</div>
				</div>
				</div>
			</div>
	<div id="paginationbyCategory"></div>
</div>


<script>
	cat_id = "${id}";
	type_id = "${type_id}";
</script>


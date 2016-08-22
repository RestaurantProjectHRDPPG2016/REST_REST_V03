

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container"
	style="border: solid 1px #dddddd; border-radius: 5px; margin-top: 10px; margin-bottom: 10px; padding: 0px;"
	ng-controller="restCtrl">
	<div class="col-md-9" style="border:solid 1px #dddddd">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"
			ng-repeat="r in rest">
			<div class="col-md-4">
			<!-- <a href="/detail/{{r.id}}"> <span ng-repeat="img in r.images">
					<img class="img-responsive" style="width: 100px; height: 100px;"
					src="http://localhost:8888/{{img.url}}" />
			</span>
			</a> -->
		</div>
		<div class="col-md-8">
				<div>
					<span style="font-size: 14px; font-weight: bolder;">{{r.name}}</span>
				</div>
				<div>
					<a href="/detail/{{r.id}}"> <!-- <div><span  style="font-size:20px; font-weight: bolder;">{{cat.name}}</span></div> -->
						<div>
							<span style="font-size: 13px;">{{r.home}} St
								{{cat.street}} {{r.commune}}</span>
						</div>
						<div>
							<span style="font-size: 13px;">{{r.district}}
								{{cat.city}}</span>
						</div> <!-- <div><span style="font-size:13px;">Knowing that items is a JSON container received through a request, so that's why I'm using a key, value method.{{r.city}}</span></div> -->
						<div ng-repeat="tele in cat.tel | limitTo:1">
							<span style="font-size: 13px;">Tel: {{tele.tel}}</span>
						</div>
					</a>
					<div style="margin-bottom: 10px;">
						<iframe
							src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fkplous%2F&width=450&layout=standard&action=like&size=small&show_faces=false&share=false&height=35&appId=1489855064642155"
							width="450" height="35" style="border: none; overflow: hidden"
							scrolling="no" frameborder="0" allowTransparency="true"></iframe>
						<a href="/locations"><span class="btn btn-default btn-sm">Visit
								Map</span></a>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="col-md-12" style="clear:both;">
	<div id="paginationRest"></div>
	</div>
</div>

<script>
category ="${category}";
province ="${province}";
district ="${district}";
commune ="${commune}";
name = "${name}";

</script> 
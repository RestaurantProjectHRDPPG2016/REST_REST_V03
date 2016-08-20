<%@include file="header_view.jsp" %>
<%-- <%@include file="menu_top_view.jsp" %> --%>
<%@include file="menu_right_view.jsp" %>
 
        <div id="page-wrapper" ng-controller="MyAdCtrl">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Restaurant</h1>
									       					       
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Restaurant
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                
                <div class="row">
                    <div class="col-lg-12" id="Res-info">
                    
                     <button class="btn btn-primary">DELETE &nbsp &nbsp <span class="glyphicon glyphicon-trash"></span></button>
					<button class="btn btn-primary">UPDATE &nbsp &nbsp <span class="glyphicon glyphicon-pencil"></span></button>
					<button class="btn btn-primary">ADD NEW &nbsp &nbsp <span class="glyphicon glyphicon-plus"></span></button>
					<br>
                        <h2>Restaurant Information</h2>
                       <div>
                   				
                            <table class="table table-bordered table-hover">
                                <thead ng-repeat="ra in restByID">
                                    <tr>
                                    	<th> Name </th>
                                    	<td>{{ra.name}}</td>
                                    </tr>
                                    <tr>
                                    	<th> Type </th>
                                    	<td>{{ra.type}}</td>
                                    </tr>
                                    <tr>
                                    	<th> Delivery </th>
                                    	<td>{{ra.delivery}}</td>
                                    </tr>
                                    <tr>
                                    	<th> Description </th>
                                    	<td>{{ra.desc}}</td>
                                    </tr>
                                    <tr>
                                    	<th> Home Number </th>
                                    	<td>{{ra.desc}}</td>
                                    </tr>
                                    <tr>
                                    	<th> Street </th>
                                    	<td>{{ra.street}}</td>
                                    </tr>
                                    <tr>
                                    	<th> Province </th>
                                    	<td>{{ra.province}}</td>
                                    </tr>
                                    <tr>
                                    	<th> District </th>
                                    	<td>{{ra.district}}</td>
                                    </tr>
                                    <tr>
                                    	<th> Commune </th>
                                    	<td>{{ra.commune}}</td>
                                    </tr> 
                                       <tr>
                                    	<th> Latitude </th>
                                    	<td>{{ra.latitude}}</td>
                                    </tr> 
                                       <tr>
                                    	<th> Longitude </th>
                                    	<td>{{ra.longitude}}</td>
                                    </tr> 
                                    <tr>
                                    	<th> Telephone </th>
	                                    	<td>
	                                    		<span ng-repeat="tel in ra.telephone" > 
	                                    				{{tel.tel}} | 
	                                    		</span>
	                                    	</td>
                                    </tr>
                                     <tr>
                                     <th> Images </th>
	                                    	<td>
	                                    		<span ng-repeat="img in ra.images" class="col-md-2 imgadmin" > 
	                                    				<img class="img-thumbnail" src="http://localhost:8888/{{img.url}}"> 
	                                    </span>
	                                    	</td>
                                    </tr>
                                     <tr>
                                    	<th> Menu </th>
                                    	<td>
                                    	<span ng-repeat="imgm in ra.menus" class="col-md-2 imgadmin"> 
                                    		<img class="img-thumbnail" src="http://localhost:8888/{{imgm.url}}">
                   						</span>
                                    	</td>
                                    </tr> 
									</tr>
                                </thead>
                            </table>
                          </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
<script>

</script>
     
        <!-- /#page-wrapper -->
    <!-- /#wrapper -->
    
<script>
		rest_id = "${id}";
</script>    
<%@include file="footer_view.jsp" %>
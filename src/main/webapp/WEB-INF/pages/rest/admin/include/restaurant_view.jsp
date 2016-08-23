	 
<%@include file="header_view.jsp"%>
<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/static/jQuery.filer/fancybox/source/jquery.fancybox.css?v=2.1.5"/>	
				<script src="${pageContext.request.contextPath}/resources/static/jQuery.filer/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
		
			
				<script src="${pageContext.request.contextPath}/resources/static/jQuery.filer/fancybox/jquery.mousewheel-3.0.6.pack.js"></script>
				
				<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/static/jQuery.filer/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />	
				
				<script src="${pageContext.request.contextPath}/resources/static/jQuery.filer/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
				
									<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/static/jQuery.filer/css/themes/jquery.filer-dragdropbox-theme.css">
	<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/static/jQuery.filer/css/jquery.filer.css?v=1.0.5"/>
	
		<script src="${pageContext.request.contextPath}/resources/static/jQuery.filer/js/jquery.filer.js?v=1.0.5"></script>
				
				
				
				<!--[if IE]>
			          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
			    <![endif]-->	
<script src="${pageContext.request.contextPath}/resources/static/jQuery.filer/js/custom.js?v=1.0.5"></script>

		

				
					
<%-- <%@include file="menu_top_view.jsp" %> --%>
<%@include file="menu_right_view.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<div id="page-wrapper" ng-controller="restCtrl">
	<div class="container-fluid">
		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Restaurant</h1>
				

				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-table"></i> Restaurant</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
<div class="panel panel-default">
		
			<div class="panel-heading" id="Res-info">
				<h2>Restaurant Information</h2>
			</div>
			<div class="panel-body">
				<div class="table-responsive">

					<button class="btn btn-success" data-toggle="modal"
						data-target="#myModal1" ng-click="addButton()">Add New</button>

					<p>&nbsp</p>
					<div>
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Name</th>
									<th>Type</th>
									<th>Delivery</th>
									<th>Description</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="r in rest">
									<td>{{r.name}}</td>
									<td>{{r.type}}</td>
									<td>{{r.delivery}}</td>
									<td>{{r.desc}}</td>
							
									<td>
										<button class="btn btn-primary">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
										<button class="btn btn-primary" data-toggle="modal"
						data-target="#myModal1" ng-click="getupdateRestauratn(this)">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
								
										<a href="/restaurant_detail_view/{{r.id}}" class="btn btn-primary">
											<span class="glyphicon glyphicon-level-up"></span>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
						<div id="paginationRest"></div>

						<!-- Modal -->
					<div class="modal fade" id="myModal1" role="dialog">
						<div class="modal-dialog modal-lg">

							Modal content
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<center><h4 class="modal-title" style="color:blue;">{{title}}</h4></center>
								</div>
								<div class="modal-body">
									<div class="container">

										<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Name:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6 col-sm-12">
													<span class="input-group-addon"><i
														class="fa fa-user" aria-hidden="true"></i></span> <input
														type="text" class="form-control" name="name" id="name"
														ng-model="name" placeholder="Enter Name" />
												</div>
											</div>
										</div>
			
											<div class="form-group" ng-controller="adminCtrl">
												<label for="name" class="cols-sm-2 col-md-2 control-label">Restaurant Category:</label>
												<div class="cols-sm-10">
													<div class="input-group col-md-6 col-sm-8">
													<select class="form-control" ng-model="category" name="category">
														<option ng-repeat="c in myCatNP" value="{{c.id}}">{{c.name}}</option>
													</select>
													</div>

												</div>
											</div>
										
										<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Description:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6 col-sm-8">
													<textarea class="form-control" name="desc" id="desc" ng-model="desc"> </textarea>
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Delivery:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6 col-sm-8">
													<input type="checkbox" name="delivery" id="delivery"
														ng-model="delivery"> &nbsp &nbspYes
												</div>
											</div>
										</div>

										<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Home:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6 col-sm-8">
													<span class="input-group-addon"><i
														class="fa fa-user" aria-hidden="true"></i></span> <input
														type="text" class="form-control" name="home" id="home"
														ng-model="home" placeholder="Enter home number" />
												</div>
											</div>
										</div>

										<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Street:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6 col-sm-8">
													<span class="input-group-addon"><i
														class="fa fa-user" aria-hidden="true"></i></span> <input
														type="text" class="form-control" name="street" id="street"
														ng-model="street" placeholder="Enter Street" />
												</div>
											</div>
										</div>
										
										<div class="form-group" id="myprovince">
											<label for="name" class="cols-sm-2 col-md-2 control-label">City / Province:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6 col-sm-8">
													<select class="form-control" name="province" id="type" ng-model="province"  ng-change="getDistrict(province)"
													ng-options="p as p.khmer_name for p in myProvince track by p.khmer_name">

														<option value="" style="display:none">
															--  Please Select City or Province --
														</option>

													</select>
												</div>

											</div>
										</div>

											<div class="form-group" id="mydistrict" id="mydistrict">
												<label for="name" class="cols-sm-2 col-md-2 control-label">District:</label>
												<div class="cols-sm-10">
													<div class="input-group col-md-6 col-sm-8">
														<select class="form-control" name="district" id="type" ng-model="district" ng-change="getCommune(district)" 
															ng-options="d as d.khmer_name for d in myDistrict track by d.khmer_name">
															<option value="" style="display:none">-- Please Select District --</option>
														</select>
													</div>

												</div>
											</div>
											<div class="form-group" id="mycommune">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Commune:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6 col-sm-8">
													<select class="form-control" name="commune" id="type" ng-model="commune"
													ng-options="c as c.khmer_name for c in myCommune track by c.khmer_name">

														<option value="" style="display:none">
														-- Please Select Commune --
														</option>

													</select>
												</div>

											</div>
										</div>
											<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Latitude:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6 col-sm-8">
													<span class="input-group-addon"><i
														class="fa fa-user" aria-hidden="true"></i></span> <input
														type="text" class="form-control" name="latitude" id="latitude"
														ng-model="latitude" placeholder="Enter latitude" />
												</div>
											</div>
										</div>
											<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Longitude:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6 col-sm-8">
													<span class="input-group-addon"><i
														class="fa fa-user" aria-hidden="true"></i></span> <input
														type="text" class="form-control" name="longitude" id="longitude"
														ng-model="longitude" placeholder="Enter longitude" />
												</div>
											</div>
										</div>

										<div class="form-group">
										<label for="name" class="cols-sm-2 col-md-2 control-label">Telephone:</label>
											<input type="button" id="mypho" title="p1"
												class="btn btn-success" value="+" />
											<div class="cols-sm-10" id="myphone">
												<div class="input-group col-md-6 col-sm-8">
													<span class="input-group-addon"><i
														class="fa fa-user" aria-hidden="true"></i></span> <input
														type="number" class="form-control" name="tel" id="tel"
														ng-model="tel" placeholder="Enter Telephone" />
												</div>
											</div>

											<div class="cols-sm-10 display-none" id="p1">
												<div class="input-group col-md-5 col-sm-8">
													<span class="input-group-addon"><i
														class="fa fa-user" aria-hidden="true"></i></span> <input
														type="number" class="form-control" name="tel" id="tel"
														ng-model="tel" placeholder="Enter Telephone 1" />
												</div>
											</div>

											<div class="cols-sm-10 display-none" id="p2">
												<div class="input-group col-md-5 col-sm-8">
													<span class="input-group-addon"><i
														class="fa fa-user" aria-hidden="true"></i></span> <input
														type="number" class="form-control" name="tel" id="tel"
														ng-model="tel" placeholder="Enter Telephone 2" />
												</div>
											</div>
											
									    <!--  		<div class="contacts">
											<div class="col-md-2"> 
           <label>Contacts:</label>
             
                    <div class="form-group multiple-form-group input-group col-md-6 col-md-offset-2">
                        <div class="input-group-btn input-group-select">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="concept">Phone</span> </span>
                            </button>
                           
                            <input type="hidden" class="input-group-select-val" name="contacts['type'][]" value="phone">
                        </div>
                        <input type="text" name="contacts['value'][]" class="form-control">
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-success btn-add">+</button>
                        </span>
                    </div> -->
                </div>			

										<div class="form-group">
											 <label for="name" class="cols-sm-2 col-md-2 control-label">Images:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6" id="restSampleInit" my-filter>
													<span ng-repeat="rest in sampleRest" filer-init>&nbsp;</span>
													<input type="file" name="img" id="img" ng-model="images"
														multiple class="file-loading" multiple> 

												</div>
											</div>
											</div>

										<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Menus:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6" id="menuSampleInit">
													<span ng-repeat="menu in sampleMenu" filer-init>&nbsp;</span>
													<input type="file" name="menus" id="menus" ng-model="menus"
														multiple class="file-loading" multiple>
												</div>
												
											</div>
										</div>

									</div>
									
										<div class="modal-footer" style="background-color:#ffffff;">
								 <button ng-click='event()' type="button" data-dismiss="modal" class="btn btn-primary" 
								 ng-disabled="">{{btnButton}}</button> 
	
									<button type="button" class="btn btn-default" 
										data-dismiss="modal">Close</button>
								</div>
								</div>
							
							</div>

						</div>
					</div> 
						
					</div>
				</div>
				</div>
			</div>
			</div>
		</div>
	<!-- /.row -->
</div>
<!-- /.container-fluid -->
<!-- /#page-wrapper -->
<!-- /#wrapper -->
<%@include file="footer_view.jsp"%>

 
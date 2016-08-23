<%@include file="header_view.jsp"%>
<%-- <%@include file="menu_top_view.jsp" %> --%>
<%@include file="menu_right_view.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div id="page-wrapper" ng-controller="slidecontroller">
	<div class="container-fluid">
		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Setting</h1>

				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-table"></i> Setting</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-12" id="Res-info">
				<h2>Slide Setting</h2>
				<div class="table-responsive">

					<button class="btn btn-success" data-toggle="modal"
						data-target="#myModal2" ng-click="addSlide()">Add New</button>

					
					<div>
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Name</th>
									<th>Description</th>
									<th>URL</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="s in getslide">
									<td>{{s.name}}</td>
									<td>{{s.description}}</td>
									<td>{{s.url}}</td>
									<td>{{s.status}}</td>
							
									<td >
										<button class="btn btn-primary" ng-click="deleteSlide(s.s_id)">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
										<button class="btn btn-primary" data-toggle="modal"
						data-target="" ng-click="(this)">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
								
										<a href="/restaurant_detail_view/{{r.id}}" class="btn btn-primary">
											<span class="glyphicon glyphicon-level-up"></span>
										</a>
									
										
										
									</td>
								</tr>
							</tbody>
						</table>
					<div id="pagination">
					</div>

						<!-- Modal -->
					  <div class="modal fade" id="myModal2" role="dialog"> 
						<div class="modal-dialog">

							Modal content
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Add Slide Setting</h4>
								</div>
								<div class="modal-body"
									style="border: 1px solid black; background-color: white; height: 100%;">
									<div class="container">

										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label">Name:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-5 col-sm-8">
													<span class="input-group-addon"><i
														class="fa fa-user" aria-hidden="true"></i></span> <input
														type="text" class="form-control" name="name" id="name"
														ng-model="name" placeholder="Enter Name" />
												</div>
											</div>
										</div>
									
										<div class="form-group">
											<label for="desc" class="cols-sm-2 control-label">Description:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-5 col-sm-8">
													<span class="input-group-addon"><i
														class="fa fa-user" aria-hidden="true"></i></span> <input
														type="text" class="form-control" name="desc" id="desc"
														ng-model="desc" placeholder="Enter Description" />
												</div>
											</div>
										</div>

										<div class="form-group">
											<label for="img" class="col-sm-2 control-label">Images:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-3 col-sm-8">
													<input type="file" class="form-control" name="img" id="img" ng-model="img" multiple>
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<label for="status" class="cols-sm-2 control-label">Status:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-5 col-sm-8">
													<input type="radio" name="status" ng-model="status" value="1" checked="checked"> 1 &nbsp;
													<input type="radio" name="status" ng-model="status" value="0"> 0
												
												</div>
											</div>
										</div>

									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-success"
										data-dismiss="modal" ng-click="addSlide()">Save</button>
									<button type="button" class="btn btn-default" 
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
				<!-- End Modal  -->
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.row -->
</div>
<!-- /.container-fluid -->


<!-- /#page-wrapper -->
<!-- /#wrapper -->
<%@include file="footer_view.jsp"%>
<script src="${pageContext.request.contextPath}/resources/script/admin/slide.js" type="text/javascript"></script>	

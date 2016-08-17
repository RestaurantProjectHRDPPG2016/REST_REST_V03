<%@include file="header_view.jsp" %>
<%-- <%@include file="menu_top_view.jsp" %> --%>
<%@include file="menu_right_view.jsp" %>

<div>
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           	Category
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Category
                            </li>
                        </ol>
                    </div>
                </div>
    <div class="row">
      <div class="col-lg-12">
          <h2>Restuarant Category</h2>
                <div class="table-responsive">
                     <table class="table table-bordered table-hover">
                         <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Action</th>
                            </tr>
                         </thead>
                          <tbody>
                             <tr ng-repeat="rt in myrestType">
								<td>{{rt.id}}</td>
								<td>{{rt.name}}</td>
								<td>
									<button class="btn btn-primary" ng-click="deleteRestType(rt.id)">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
									 <button class="btn btn-primary" data-toggle="modal" data-target="#myRestType1" ng-click="editRestType(this)">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>
									<button class="btn btn-primary">
										<span class="glyphicon glyphicon-plus"  ng-click="changeRestType(1)" data-toggle="modal" data-target="#myRestType1"></span>
									</button>
									 
								</td>
							</tr>
                         </tbody>
                  </table>
               </div>
           </div>
      </div>
        <!-- Add Modal -->         
         <div class="modal fade" id="myRestType1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h4>Operation</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" name="myForm" method="post">
							<div class="form-group">
								<label for="name" class="col-xs-3 control-label">Name :</label>
								<div class="col-xs-9">
									<input type="text" class="form-control" ng-model="name" placeholder="Ex : Pizza">
								</div>
							</div>		
						<div class="form-group">
				  		    <div class="col-xs-offset-3 col-xs-9">
							  <button class="btn btn-success" id="add"  ng-click="addRestType()"  data-dismiss="modal">My Add</button>
				  		      <button class="btn btn-success"  id="update"  ng-click="updateRestType()" data-dismiss="modal">Submit</button> 
				  		      </div>
			  		      </div>
						</form>
					</div>
				</div>
			</div>
		</div>
                
     </div>
     
    
    		
                <div class="row">
             
                    <div class="col-lg-12">
                        <h2>Main Category</h2>
                        <button class="btn btn-success" data-toggle="modal" data-target="#myModal" ng-click="changeMode(0)"><span class="glyphicon glyphicon-plus"></span> Add New Category</button><br>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Img1</th>
                                        <th>Img2</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <!-- Hello  -->
                                    <tr ng-repeat="c in myCat">
                                        <td>{{c.id}}</td>
                                        <td>{{c.name}}</td>
                                        <td>{{c.img1}}</td>
                                        <td>{{c.img2}}</td>
                                        	<th>
											<button class="btn btn-primary" ng-click="deleteCategory(c.id)"><span class="glyphicon glyphicon-trash"></span></button>
											<button class="btn btn-primary" data-toggle="modal"  data-target="#myModal" ng-click="editCategory(this)"><span class="glyphicon glyphicon-pencil" ></span></button>
										</th>
                                    </tr>
                                </tbody>
                            </table>
                         
                        </div>
                    </div>
                </div>      <!-- /.row -->
                <!-- Add Modal -->         
         <div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h4>Operation</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" name="myForm" method="post">
							<div class="form-group">
								<label for="name" class="col-xs-3 control-label">Name:</label>
								<div class="col-xs-9">
									<input type="text" class="form-control" ng-model="name" placeholder="Ex : Pizza">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-xs-3 control-label">Type:</label>
								<div class="col-xs-9">
								<select name="rest_type" id="resttype" ng-model="rest_type">
										<option ng-repeat="mrt in myrestType" value="{{mrt.id}}">
											{{ mrt.name}}</option>
								</select>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-xs-3 control-label">Image 1:</label>
								<div class="col-xs-9">
									<input type="file" class="form-control" id="img1" ng-model="img1" multiple>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-xs-3 control-label">Image 2:</label>
								<div class="col-xs-9">
									<input type="file" class="form-control"  id="img2" ng-model="img2" multiple>
								</div>
							</div>
							
						<div class="form-group">
				  		    <div class="col-xs-offset-3 col-xs-9">
							  <button class="btn btn-success"  id="addCat"  ng-click="addCategory()"  data-dismiss="modal">Add</button>
				  		      <button class="btn btn-success"  id="updateCat"  ng-click="updateCategory()" data-dismiss="modal">Submit</button>
				  		      </div>
			  		      </div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
			            <div id="pagination">
	</div>
        </div>        

      
            </div>
            <!-- /.container-fluid -->

       
        <!-- /#page-wrapper -->
    <!-- /#wrapper -->
<%@include file="footer_view.jsp" %>
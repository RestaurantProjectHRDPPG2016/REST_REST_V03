<%@include file="header_view.jsp" %>
<%-- <%@include file="menu_top_view.jsp" %> --%>
<%@include file="menu_right_view.jsp" %>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           	Members
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Members
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				<div class="col-md-12">
					<button class="btn btn-primary" id="myadmin">Admin</button>
					<button class="btn btn-primary" id="myowner">Restaurant Owner</button>

			<button class="btn btn-primary" id="myuser">User</button>

		</div>

                <div class="row">
                      <div class="col-lg-6">
                        <h2>Total Number of members</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Admin</th>
                                        <th>Restaurant Owner</th>
                                        <th>Normal Member</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>123</td>
                                        <td>39034</td>
                                        <td>3453465</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
               
                    <div class="col-lg-12 display-none" id="admin">
                        <h2>Administratro information</h2>
                        <button class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>Add New Administrator</button>
										
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Name</th>
                                        <th>email</th>
                                        <th>password</th>
                                        <th>gender</th>
                                        <th>status</th>
                                        <th>role</th>
                                        <th>active</th>
                                        <th>address</th>
                                        <th>action</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                        <tr>
                                        <th>1</th>
                                        <th>Youra</th>
                                        <th>youra@gmail.com</th>
                                        <th>password</th>
                                        <th>gender</th>
                                        <th>1</th>
                                        <th>admin</th>
                                        <th>sdkfjsar43kwrlwerk</th>
                                        <th>Phnom Penh</th>
										<th>
											<button class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button>
											<button class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span></button>
											</th>
										</tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="col-lg-12 display-none" id="owner">
                        <h2>Owner information</h2>
                        <button class="btn btn-primary"><span class="glyphicon glyphicon-plus"</span>Add new Owner</button>
										
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Name</th>
                                        <th>email</th>
                                        <th>password</th>
                                        <th>gender</th>
                                        <th>status</th>
                                        <th>role</th>
                                        <th>active</th>
                                        <th>address</th>
                                        <th>action</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                        <tr>
                                        <th>1</th>
                                        <th>Youra</th>
                                        <th>youra@gmail.com</th>
                                        <th>password</th>
                                        <th>gender</th>
                                        <th>1</th>
                                        <th>admin</th>
                                        <th>sdkfjsar43kwrlwerk</th>
                                        <th>Phnom Penh</th>
										<th>
											<button class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button>
											<button class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span></button>
											</th>
										</tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-12 display-none" id="user">
                        <h2>User information</h2>
                        <button class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>Add User</button>
									
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Name</th>
                                        <th>email</th>
                                        <th>password</th>
                                        <th>gender</th>
                                        <th>status</th>
                                        <th>role</th>
                                        <th>active</th>
                                        <th>address</th>
                                        <th>action</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                        <tr>
                                        <th>1</th>
                                        <th>Youra</th>
                                        <th>youra@gmail.com</th>
                                        <th>password</th>
                                        <th>gender</th>
                                        <th>1</th>
                                        <th>admin</th>
                                        <th>sdkfjsar43kwrlwerk</th>
                                        <th>Phnom Penh</th>
										<th>
											<button class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button>
											<button class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span></button>
												</th>
										</tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                  </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
        <!-- /#page-wrapper -->
           </div>
    <!-- /#wrapper -->
<%@include file="footer_view.jsp" %>
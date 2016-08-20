<%@include file="header_view.jsp"%>
					
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
				<button type="button" class="btn btn-success" data-dismiss="modal"
					id="myTel-info">Telephone</button>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					id="myRestImg-info">Image</button>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					id="myRestMenu-info">Menu</button>
				<button type="button" class="btn btn-success" data-dismiss="modal"
					id="myRestProduct-info">Product</button>

				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-table"></i> Restaurant</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-12" id="Res-info">
				<h2>Restaurant Information</h2>
				<div class="table-responsive">

					<button class="btn btn-success" data-toggle="modal"
						data-target="#myModal1" ng-click="addButton()">Add New</button>

					
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
					<div id="pagination">
					</div>

						<!-- Modal -->
					<div class="modal fade" id="myModal1" role="dialog">
						<div class="modal-dialog modal-lg">

							<!-- Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Add Restaurant Information</h4>
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
										<div>
											<div class="form-group" ng-controller="adminCtrl">
												<label for="name" class="cols-sm-2 col-md-2 control-label">Restaurant Category:</label>
												<div class="cols-sm-10">
													<div class="input-group col-md-6 col-sm-8">
													<select class="form-control" ng-model="category" name="category">
														<option ng-repeat="c in myCat" value="{{c.id}}">{{c.name}}</option>
													</select>
													</div>

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
										
										<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">City / Province:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6 col-sm-8">
													<select class="form-control" name="province" id="type" ng-model="province"  ng-change="getDistrict(province.id)"
													ng-options="p as p.khmer_name for p in myProvince track by p.khmer_name">

														<option value="" style="display:none">
															--  Please Select City or Province --
														</option>

													</select>
												</div>

											</div>
										</div>

											<div class="form-group">
												<label for="name" class="cols-sm-2 col-md-2 control-label">District:</label>
												<div class="cols-sm-10">
													<div class="input-group col-md-6 col-sm-8">
														<select class="form-control" name="district" id="type" ng-model="district" ng-change="getCommune(district.id)" 
															ng-options="d as d.khmer_name for d in myDistrict track by d.khmer_name">
															<option value="" style="display:none">-- Please Select District --</option>
														</select>
													</div>

												</div>
											</div>
											<div class="form-group">
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
										<!-- 	<label for="name" class="cols-sm-2 col-md-2 control-label">Telephone:</label>
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
											</div> -->
											
											<div class="contacts">
											<div class="col-md-2">
                <label>Contacts:</label>
                </div>
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
                    </div>
                </div>
            </div>
											
										</div>

										<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Images:</label>
											<div class="cols-sm-10">
												<div class="input-group col-md-6">
													<!-- <input type="file" name="img" id="img" ng-model="images"
														multiple class="file-loading" multiple> -->

												<!-- 	<div id="content">

														<h4 ng-repeat="s in sample" my-filter>Example 2:</h4>
														<input type="file" name="files[]" id="gallery"
															multiple="multiple">
														<h1 ng-click="show()">Show</h1>
													</div> -->

												</div>
											</div>
										</div>

										<div class="form-group">
											<label for="name" class="cols-sm-2 col-md-2 control-label">Menus:</label>
											<div class="cols-sm-10">
												<!-- <div class="input-group col-md-6">
													<input type="file" name="menus" id="menus" ng-model="menus"
														multiple class="file-loading" multiple>
												</div> -->
												<div class="input-group col-md-6">
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
		<!-- /.row -->

		<div class="col-lg-12 display-none" id="Tel-info">
			<h2>Telephone</h2>
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Brand_ID</th>
							<th>Name</th>
							<th>Tel</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1</th>
							<th>Sovanna</th>
							<th>0909</th>
							<th>
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-trash"></span>
								</button>
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-pencil"></span>
								</button>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="col-lg-12 display-none" id="RestImg-info">
			<h2>Image</h2>
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Brand_ID</th>
							<th>Brand_Name</th>
							<th>Image</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1</th>
							<th>Pizza</th>
							<th>Image</th>
							<th>
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-trash"></span>
								</button>
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-pencil"></span>
								</button>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="col-lg-12 display-none" id="RestMenu-info">
			<h2>Menu</h2>
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Brand_ID</th>
							<th>Brand_Name</th>
							<th>Menu Img</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1</th>
							<th>Pizza</th>
							<th>Image</th>
							<th>
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-trash"></span>
								</button>
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-pencil"></span>
								</button>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12 display-none" id="RestProduct-info">
				<h2>Products</h2>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Rest_ID</th>
								<th>Pro_ID</th>
								<th>Pro_Name</th>
								<th>Pro_Detail</th>
								<th>Pro_Price</th>
								<th>Pro_Type</th>
								<th>Pro_Date</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>1</th>
								<th>1</th>
								<th>Pro_Name</th>
								<th>Pro_Detail</th>
								<th>Pro_Price</th>
								<th>Pro_Type</th>
								<th>Pro_Date</th>
								<th>
									<button class="btn btn-warning">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
									<button class="btn btn-success">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>
									<button class="btn btn-primary">
										<span class="glyphicon glyphicon-th"></span>
									</button>
								</th>
							</tr>
						</tbody>
					</table>
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

<script>
(function ($) {
    $(function () {

        var addFormGroup = function (event) {
            event.preventDefault();

            var $formGroup = $(this).closest('.form-group');
            var $multipleFormGroup = $formGroup.closest('.multiple-form-group');
            var $formGroupClone = $formGroup.clone();

            $(this)
                .toggleClass('btn-success btn-add btn-danger btn-remove')
                .html('–');

            $formGroupClone.find('input').val('');
            $formGroupClone.find('.concept').text('Phone');
            $formGroupClone.insertAfter($formGroup);

            var $lastFormGroupLast = $multipleFormGroup.find('.form-group:last');
            if ($multipleFormGroup.data('max') <= countFormGroup($multipleFormGroup)) {
                $lastFormGroupLast.find('.btn-add').attr('disabled', true);
            }
        };

        var removeFormGroup = function (event) {
            event.preventDefault();

            var $formGroup = $(this).closest('.form-group');
            var $multipleFormGroup = $formGroup.closest('.multiple-form-group');

            var $lastFormGroupLast = $multipleFormGroup.find('.form-group:last');
            if ($multipleFormGroup.data('max') >= countFormGroup($multipleFormGroup)) {
                $lastFormGroupLast.find('.btn-add').attr('disabled', false);
            }

            $formGroup.remove();
        };

        var selectFormGroup = function (event) {
            event.preventDefault();

            var $selectGroup = $(this).closest('.input-group-select');
            var param = $(this).attr("href").replace("#","");
            var concept = $(this).text();

            $selectGroup.find('.concept').text(concept);
            $selectGroup.find('.input-group-select-val').val(param);

        }

        var countFormGroup = function ($form) {
            return $form.find('.form-group').length;
        };

        $(document).on('click', '.btn-add', addFormGroup);
        $(document).on('click', '.btn-remove', removeFormGroup);
        $(document).on('click', '.dropdown-menu a', selectFormGroup);

    });
})(jQuery);

/* 
Image JQUER */


    var app = angular.module('myApp', []);
    app.controller('Ctrl', function ($scope) {
        $scope.sample = [
            {
                name: "1",
                type: "image/jpg",
                size: '',
                file: "http://www.gettyimages.com/gi-resources/images/Homepage/Hero/US/MAR2016/prestige-587705839_full.jpg"
            },
            {
                name: "2",
                size: '',
                type: "image/jpg",
                file: "http://i.imgur.com/RRUe0Mo.png"
            }
        ];

        $scope.show = function(){
            console.log('File To Send', validatedFiles);
            console.log('Image Name to Delete', deletedImageName);
        }
    });

    app.directive('myFilter', [function() {
        return {
            restrict: 'A',       
            link: function(scope, element) {
                // wait for the last item in the ng-repeat then call init
                if(scope.$last) {
                    initJqueryFiler('#gallery', scope.sample);
                }
            }
        };
        /**** Usable array ****/
        // => validatedFiles
        // => deletedImageName

    }]);
        





</script>
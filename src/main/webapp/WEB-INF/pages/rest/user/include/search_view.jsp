
<div class="container" id="search" ng-controller="adminCtrl">
<div class="col-md-2 col-sm-2 col-xs-3" style="float:left">
		<img class="img-responsive" style="padding:10px;" src="${pageContext.request.contextPath}/resources/upload/playlist/img/freshologo.png"/>
	</div>
<div class="col-md-10">
 <div class="input-group col-md-8 col-sm-8 col-xs-8" id="adv-search">
                <input type="text" class="form-control" placeholder="Search for Filings" />
                <div class="input-group-btn">
                    <div class="btn-group" role="group">
                        <div class="dropdown dropdown-lg">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="searchbtn" aria-expanded="false"><span class="caret"></span></button>
                            <div class="dropdown-menu dropdown-menu-right" role="menu" id="mysearchbtn">
                                <form class="form-horizontal" role="form">
                                  <div class="form-group">
                                    <label for="filter">Filter by</label>
                              
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Filer</label>
                                  	<select class="form-control"  ng-model="category" name="category">
											<option ng-repeat="c in myCat" value="{{c.id}}">{{c.name}}</option>
									</select>
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Search Restaurant Name</label>
                                    <input class="form-control glyphicon glyphicon-search" type="text" placeholder="location" />
                                   
                                  </div>
                                   <div class="form-group">
                                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"> &nbspAuto search youra location here</span></button>
                                  </div>
                                </form>
                            </div>
                        </div>
                        <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-search" aria-hidden="false"></span></button>
                    </div>
                </div>
            </div>
  <div class="col-md-4" style="margin-top:-34px; float:right;">
    
 <!-- 
    <div class="input-group add-on">
      <input type="button" class="form-control" value="Phnomm Penh , Tul Kork" name="srch-term" id="srch-term">
      <div class="input-group-btn">
        <button class="btn btn-default" type="button"><i class="glyphicon glyphicon-map-marker"></i></button>
      </div>
    </div>
 -->
 
 <div class="input-group col-md-12 col-sm-12 col-xs-12">
                <input type="button" class="form-control" id="location"  value="Phnom Penh, Tul Kork"/>
                <div class="input-group-btn">
                    <div class="btn-group" role="group">
                        <div class="dropdown dropdown-lg">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                            <div class="dropdown-menu dropdown-menu-right" role="menu" id="mylocation">
                                <form class="form-horizontal" role="form">
                                  <div class="form-group">
                                    <label for="filter">Filter by</label> <select class="form-control"
											name="province" id="type" ng-model="province"
											ng-change="getDistrict(province.id)"
											ng-options="p as p.khmer_name for p in myProvince track by p.id">

											<option value="" style="display: none">-- Please
												Select City or Province --</option>

										</select> <select class="form-control" name="district"
											id="type" ng-model="district"
											ng-change="getCommune(district.id)"
											ng-options="d as d.khmer_name for d in myDistrict track by d.id">
											<option value="" style="display: none">-- Please
												Select District --</option>
										</select> <select class="form-control" name="commune"
											id="type" ng-model="commune"
											ng-options="c as c.khmer_name for c in myCommune track by c.id">

											<option value="" style="display: none">-- Please
												Select Commune --</option>

										</select>
									</div>
                                   <div class="form-group">
                                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"> &nbspAuto search youra location here</span></button>
                                  </div>
                                </form>
                            </div>
                        </div>
                        <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-map-marker" aria-hidden="false"></span></button>
                    </div>
                </div>
            </div>
 
  </div>
  <br>
            Type : &nbsp <a  ng-repeat="r in myrestType" style="font-size:12px;" href="/typerestaurant/{{r.id}}">{{r.name}}</a>
		
  
</div>
</div>

<script>

$(document).ready(function() {

	$("#location").click(function(){
		$("#mylocation").toggle();
	});


});
</script>


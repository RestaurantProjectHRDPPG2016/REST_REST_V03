  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- detail -->
<div class="container margintop5">
  <div class="row panel-group">
	<div class="panel panel-info">
	<div class="panel-heading text-center">ព័តមានលំអិតរបស់ភោជនីយដ្ខាន</div>
	<div class="panel-body">
  <div ng-controller="MyAdCtrl">
	<div ng-repeat="r in restByID"> 

                <div class="row">
            
                	<div class="row">
                		<center>
                					<img ng-repeat="image in r.images | limitTo:1" style="width:200px; height:200px; background:#dddddd;" class="fab" src="http://localhost:8888{{image.url}}" alt="" />
                		</center>
                	
                	
                	</div>
                    <div class="row">
                        <center><h1 class="name">  {{r.name}}</h1></center>
                    </div>
                    <center class="mystar">
                      <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                     		 <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                     		 
                      <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"  ></span><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
                       </center>
                            
                       	 <center><b>{{r.desc}} </b></center>
                       	 <br><br>
                 <div class="row">
                 		<center>
	                       <button class="fab"><span> # </span>{{r.home}}</button>
	                       <button class="fab"> St {{r.street}}</button>
	                       <button class="fab"> {{r.commune}} </button>
	                       <button class="fab"> {{r.district}} </button>
	                       <button class="fab"> {{r.province}}</button>
	                       <button class="fab">ដឹកជញ្ជូន : {{r.delivery}}</button>
                       </center>
                  </div>
                       
                        <div class="row">
                       <span ng-repeat="t in r.tel">{{t.tel}} | </span>
                       </div>
                       <br>
							<div class="col-md-12">
								<center>
									<span class="btn btn-sm btn-primary">Like</span> 
									<a href="/locations/{{r.id}}"><span
										class="btn btn-default btn-sm">Visit Map</span></a>
				
				
				<div star-rating rating="starRating1" read-only="false" max-rating="10" click="click1(param)" mouse-hover="mouseHover1(param)" mouse-leave="mouseLeave1(param)"></div>
            <div> <span class="label label-primary">Star Rating: {{starRating1}}</span>
 <span class="label label-primary">Hover Rating: {{hoverRating1}}</span>

            </div>
        </div>
				
				
								</center>
							</div>
						</div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
           <div class="container">
             <div class="row panel-group" ng-controller="MyAdCtrl">
	<div class="panel panel-info">
	<div class="panel-heading text-center">មីនុយ</div>
	<div class="panel-body" ng-repeat="r in restByID">
	        <section>  
			    <div class="col-md-2" ng-repeat="image in r.images">
				   <a class="example-image-link img-responsive" 
				   href="http://localhost:8888{{image.url}}" data-lightbox="example-set">
 				   <img class="img-responsive img-thumbnail example-image" src="http://localhost:8888{{image.url}}" alt="" />
 				   </a> 
			  </div>
			  </section>
          </div>  
         </div>   
       </div>   
    </div> <!-- /container -->
    
    
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owner/lightbox.css">

<script
	src="${pageContext.request.contextPath}/resources/script/owner/lightbox-plus-jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/owner/photo-gallery.js"
	type="text/javascript"></script>    

<script src="${pageContext.request.contextPath}/resources/script/owner/lightbox.js"></script>

<script>
		rest_id = "${id}";
		
</script> 


 <!-- Start Restaurant Category -->
 
 <style>
<!--
#div0 img{
			margin-top:5px;
			float: left;
			padding: 13.2px;
		}
    .element-animation{
  animation: animationFrames ease 1s;
  animation-iteration-count: 1;
  transform-origin: 50% 50%;
  animation-fill-mode:forwards; /*when the spec is finished*/
  -webkit-animation: animationFrames ease 1s;
  -webkit-animation-iteration-count: 1;
  -webkit-transform-origin: 50% 50%;
  -webkit-animation-fill-mode:forwards; /*Chrome 16+, Safari 4+*/ 
  -moz-animation: animationFrames ease 1s;
  -moz-animation-iteration-count: 1;
  -moz-transform-origin: 50% 50%;
  -moz-animation-fill-mode:forwards; /*FF 5+*/
  -o-animation: animationFrames ease 1s;
  -o-animation-iteration-count: 1;
  -o-transform-origin: 50% 50%;
  -o-animation-fill-mode:forwards; /*Not implemented yet*/
  -ms-animation: animationFrames ease 1s;
  -ms-animation-iteration-count: 1;
  -ms-transform-origin: 50% 50%;
  -ms-animation-fill-mode:forwards; /*IE 10+*/
}
#div2{
	display: none;
}

@keyframes animationFrames{
  0% {
    opacity:0;
    transform:  translate(0px,-25px)  ;
  }
  100% {
    opacity:1;
    transform:  translate(0px,0px)  ;
  }
}

-->
</style>
<div class="container" style=" padding: 0px;" id="mynavbar" ng-controller="adminCtrl">
	<div class="navbar-header">
	   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#div0">
	        <span class="glyphicon glyphicon-th-large"></span>
	     </button>
	</div>
	<div>
		<div class="collapse navbar-collapse mycontain" >
		  <div  id="div0">
			<div id="div1" class="thumbnail item" ng-repeat="c in myCat | limitTo:7">
				<a href="/owner/{{c.id}}">
					<img  src="${pageContext.request.contextPath}/resources/upload/playlist/img/{{c.img1}}" >
					    <span class="caption">{{c.name}}</span>
				</a>
	     	</div>
	     	<div id="div2" class="thumbnail item div2" ng-repeat="c in myCat | limitTo:myCat.length:7">
				<a href="/owner/{{c.id}}">
					<img  src="${pageContext.request.contextPath}/resources/upload/playlist/img/{{c.img1}}" >
					    <span class="caption">{{c.name}}</span>
				</a>
	     	</div>
	       </div>
	  	</div>
	</div>
	
	<script>
	$(document).ready(function(){
	$("#div0").hover(function(){
		$(".div2").css('display','inline-block');
	    $(".div2").addClass("element-animation");

    }, function(){
          $(".div2").slideUp('slow');
        $(".div2").removeClass("element-animation");
        //});
        
      });
    
});
</script>
</div>
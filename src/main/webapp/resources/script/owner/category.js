
$(document).ready(function(){
	$("#div0").hover(function(){
		$("#div2").css('display','inline-block');
       //$("#div2").animate({display:"block"},1500,function(){alert('show')});
       
    $("#div2").addClass("element-animation");

    }, function(){

        //$("#div2").animate({height: '0px'}, 1000, function(){
          $("#div2").slideUp('slow');
        $("#div2").removeClass("element-animation");
        //}); 
      });
});
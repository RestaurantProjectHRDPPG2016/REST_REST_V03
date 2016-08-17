
$(document).ready(function() {
	$("#searchbtn").click(function(){
		$("#mysearchbtn").toggle();
	});
	
	$("#location").click(function(){
		$("#	mylocation").toggle();
	});

	$(document).on('mouseenter','.default',function(){
		$(this).hide();
		$(this).next().show();
	});
	
	$(document).on('mouseleave','.cover',function(){
		$(this).hide();
		$(this).prev().show();
	});

});
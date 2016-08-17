/**
 * 
 */
//restaurant
$(document).ready(function(){
		$("#myTel-info").click(function(){
			$("#Tel-info").show();
			$("#RestImg-info").hide();
			$("#RestMenu-info").hide();
			$("#RestProduct-info").hide();
		});
		$("#myRestImg-info").click(function(){
			$("#RestImg-info").show();
			$("#Tel-info").hide();
			$("#RestMenu-info").hide();
			$("#RestProduct-info").hide();
		});
		$("#myRestMenu-info").click(function(){
			$("#RestMenu-info").show();
			$("#RestImg-info").hide();
			$("#Tel-info").hide();
			$("#RestProduct-info").hide();
		});
		$("#myRestProduct-info").click(function(){
			$("#RestProduct-info").show();
			$("#RestImg-info").hide();
			$("#Tel-info").hide();
			$("#RestMenu-info").hide();
		})	
		
		
//		Modal
		$("#mypho").click(function(){
			if($("#mypho").attr("title")=='p1'){
				$("#p1").slideDown();
				$("#mypho").prop('title','p2');
			}
			else{
				$("#p2").slideDown();
			}
			
		});
		
});

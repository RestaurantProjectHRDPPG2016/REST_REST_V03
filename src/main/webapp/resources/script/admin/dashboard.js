
/*admin*/

		$("#myadmin").click(function(){
			$("#admin").show();
			$("#user").hide();
			$("#owner").hide();
		});

		$("#myowner").click(function(){
			$("#owner").show();
			$("#admin").hide();
			$("#user").hide();
		});

		$("#myuser").click(function(){
			$("#admin").hide();
			$("#user").show();
			$("#owner").hide();
		});




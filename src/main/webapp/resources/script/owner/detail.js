$(document).ready(function(){
	$("div.fcate").click(function(){
		if($(this).attr('title')=="hide"){
			$(this).find("span.arrowdown").css({"display":"block"});
			$(this).find("span.arrowup").css({"display":"block"});
			$(this).find("div.scate").slideDown(200);	
			$(this).css({"background-color":"black"});
			$(this).prop('title', 'show');
		}
		else{
			$(this).find("span.arrowdown").css({"display":"block"});
			$(this).find("span.arrowup").css({"display":"none"});
			$(this).find("div.scate").slideUp(200);
			$(this).css({"background-color":"#616161"});
			$(this).prop('title', 'hide');					
		}
	});
	$("div.scate").click(function(event){
		if($(this).attr('title')=="hide"){
			$(this).find("div.tcate").slideDown(200);
			$(this).find("span.sarrowup").css({"display":"block"});
			$(this).find("span.sarrowdown").css({"display":"none"});	
			$(this).prop('title', 'show');
			event.stopPropagation();			
		}
		else{
			$(this).find("div.tcate").slideUp(200);
			$(this).find("span.sarrowup").css({"display":"none"});
			$(this).find("span.sarrowdown").css({"display":"block"});	
			$(this).prop('title', 'hide');	
			// $(this).css({"background-color":"#616161"});
			event.stopPropagation();	
		}				
	});
	$("div.tcate").click(function(event){
		event.stopPropagation();
	});
	$("#bshow").click(function(){
		$("#show").css({"display":"block"});
		$("#comment").css({"display":"none"});
		$(this).css({"border-bottom":"0px"});
		$("#bcomment").css({"border-bottom":"1px solid black","background-color":"black"});
		$("#bshow").css({"background-color":"#F5F5F5"});
	});
	$("#bcomment").click(function(){
		$("#show").css({"display":"none"});
		$("#comment").css({"display":"block"});
		$(this).css({"border-bottom":"0px"});
		$("#bshow").css({"border-bottom":"1px solid black","background-color":"black"});
		$("#bcomment").css({"background-color":"#F5F5F5"});
	});
	
});

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-36251023-1']);
_gaq.push(['_setDomainName', 'jqueryscript.net']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();


$(document).ready(function(){

	$("#header").mouseenter(function(){
		$(this).animate({
			height: '+=10px'
		});
	});
	$("#header").mouseenter(function(){
		$(this).animate({
			height: '-=10px'
		});
	});
	$("#header").click(function(){
		$(this).toggle(1000)
	});
	
});


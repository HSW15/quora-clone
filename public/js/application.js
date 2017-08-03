
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

	$(".test").on("click", function(event){
		event.preventDefault()
		console.log("Heyawda");

		$.ajax({
			url: $(event.target).parent()[0].href,
			method: "get",
			dataType: "json",
			success: function(data){
				debugger;
				id = data[0].id
				$('#answer-' + id + '-upvote-count').text(data[1])
				$('#answer-' + id + '-downvote-count').text(data[2])
				$(event.target).parent().attr('disabled',true)
				$(event.target).attr('id','button_disabled_up')
				$(event.target).parent().next().next().children().attr('disabled',false)
				$(event.target).parent().next().next().next().attr('id',"arrow-down")
			}
		})
	})
});


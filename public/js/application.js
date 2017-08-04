
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

	$(".upvote").on("click", function(event){
		event.preventDefault()
		console.log("Heyawda");

		$.ajax({
			url: $(event.target).parent()[0].href,
			method: "get",
			dataType: "json",
			success: function(data){
				
				id = data[0].id
				$('#answer-' + id + '-upvote-count').text(data[1])
				$('#answer-' + id + '-downvote-count').text(data[2])
				$(event.target).parent().attr('disabled',true)
				$(event.target).attr('id','button_disabled_up')
				$(event.target).parent().next().next().attr('disabled',false)
				$(event.target).parent().next().next().children().attr('id',"arrow-down")
			}
		})
	})

	$(".downvote").on("click", function(event){
		event.preventDefault()
		console.log("Heyawda");
		
		$.ajax({
			url: $(event.target).parent()[0].href,
			method: "get",
			dataType: "json",
			success: function(data){
				
				id = data[0].id
				$('#answer-' + id + '-upvote-count').text(data[1])
				$('#answer-' + id + '-downvote-count').text(data[2])
				$(event.target).parent().attr('disabled',true)
				$(event.target).attr('id','button_disabled_down')
				$(event.target).parent().prev().prev().attr("disabled",false)
				$(event.target).parent().prev().prev().children().attr('id',"arrow-up")
			}
		})
	})
	$(".preupvote").on("click", function(event){
		event.preventDefault()
		console.log("Heyawda");
		
		$.ajax({
			url: $(event.target).parent()[0].href,
			method: "get",
			dataType: "json",
			success: function(data){
				
				id = data[0].id
				$('#preanswer-' + id + '-upvote-count').text(data[1])
				$('#preanswer-' + id + '-downvote-count').text(data[2])
				$(event.target).parent().attr('disabled',true)
				$(event.target).attr('id','button_disabled_up')
				$(event.target).parent().parent().next().next().attr("disabled",false)
				$(event.target).parent().parent().next().next().children().attr("id","arrow-down")
			}
		})
	})
	$(".predownvote").on("click", function(event){
		event.preventDefault()
		console.log("Heyawda");
		
		$.ajax({
			url: $(event.target).parent()[0].href,
			method: "get",
			dataType: "json",
			success: function(data){
				
				id = data[0].id
				$(event.target).parent().attr('disabled',true)
				$('#preanswer-' + id + '-upvote-count').text(data[1])
				$('#preanswer-' + id + '-downvote-count').text(data[2])
				$(event.target).attr('id','button_disabled_down')
				$(event.target).parent().prev().prev().children().attr("disabled",false)
				$(event.target).parent().prev().prev().children().children().attr("id","arrow-up")
			}
		})
	})

});


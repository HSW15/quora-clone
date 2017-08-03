get '/answers/:answer_id/upvote' do
	@answer = Answer.find(params[:answer_id])
	@answer_vote = @answer.answers_votes.find_by(user_id: current_user.id)

	unless @answer_vote
		@answer_vote = current_user.answers_votes.new(user_id: current_user.id, answer_id: params[:answer_id].to_i, vote: true)
		@answer_vote.save
		@answer.upvote_count += 1
		@answer.save
	end
	if @answer_vote.vote == false
		@answer_vote.vote = true
		@answer_vote.save
		@answer.upvote_count += 1
		@answer.downvote_count -= 1
		@answer.save
	end
	a = []
	a << @answer
	a << @answer.upvote_count
	a << @answer.downvote_count
	return a.to_json
end

get '/answers/:answer_id/downvote' do
	@answer = Answer.find(params[:answer_id])
	@answer_vote = @answer.answers_votes.find_by(user_id: current_user.id)

	unless @answer_vote
		@answer_vote = AnswersVote.new(user_id: current_user[:id], answer_id: params[:answer_id].to_i, vote: false)
		@answer_vote.save
		@answer.downvote_count += 1
		@answer.save
	end
	if @answer_vote.vote == true
		@answer_vote.vote = false
		@answer_vote.save
		@answer.downvote_count += 1
		@answer.upvote_count -= 1
		@answer.save
	end
	a = []
	a << @answer
	a << @answer.upvote_count
	return a.to_json
end
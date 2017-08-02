get '/questions/:question_id/answers/new' do
	@question = Question.find(params[:question_id])
	erb :"answers/new"
end

post '/questions/:question_id/answers' do
	@answer = Answer.new(answer_description: params[:answer][:answer_description], question_id: params[:question_id].to_i, user_id: current_user.id)
	if @answer.save
		redirect "/answers"
	else
		erb :"answers/new"
	end
end

get '/answers' do
	erb :"questions/index"
end

patch '/questions/:question_id/answers/:answer_id' do
	@answer = Answer.find(params[:answer_id].to_i)
	
	if @answer.update(params[:answer])
		redirect "/questions"
	else
		@bool = "incorrect"
		erb :"answer/edit"
	end
	
end

delete '/questions/:question_id/answers/:answer_id' do
	@answer = Answer.find(params[:answer_id].to_i)
	@answer.destroy
	redirect "/questions"
end
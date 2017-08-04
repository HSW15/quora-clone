get '/questions' do
	erb :"questions/index"
end

get '/users/:id/questions/new' do
	@user = User.find(params[:id])
	erb :"questions/new"
end

post '/users/:id/questions' do
	@question = Question.new(question_title: params[:question][:question_title], question_description: params[:question][:question_description], user_id: params[:id])
	if @question.save
		redirect "/questions"
	else
		redirect "/users/:id/questions/new"
	end
end

get '/questions/:id' do
	@question = Question.find(params[:id].to_i)
	
	erb :"questions/show"
end

get '/questions/:id/edit' do

	@question = Question.find(params[:id].to_i)
	
	erb :"questions/edit"
end

patch '/questions/:id' do
	@question = Question.find(params[:id].to_i)
	if @question.update(params[:question]) && current_user.authenticate(params[:user][:password])
		redirect "/questions"
	else
		@bool = "incorrect"
		erb :"questions/edit"
	end
end

delete '/questions/:id' do 
	
	question = Question.find(params[:id].to_i)
	question.destroy
	redirect "/questions"
end
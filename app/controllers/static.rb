require 'byebug'



get '/' do
  erb :"static/index"
end

post '/signup' do
	@user = User.new(params[:user])
	@bool = @user.save
	if @user.save
		
		session[:user_id] = @user.id
		erb :"static/success"
		
	else
		@errors = @user.errors.full_messages.join(",")
		erb :"static/index"
	end
end

post "/login" do
	@user = User.find_by(email: params[:user][:email])
	
	if @user == nil
		@user = "incorrect"
		erb :"static/index"
	else
		if @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			erb :"static/index"
		else	
			@bool2 = false
			erb :"static/index"
		end
	end
end


post '/logout' do
	session.destroy
	redirect "/"
end


get '/users' do
	
	if current_user.id == session[:user_id]
		@user = User.find(current_user.id)
		erb :"static/user_profile"
	else
		redirect '/'
	end
end

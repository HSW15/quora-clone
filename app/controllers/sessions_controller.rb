	# create action for sessions
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

# delete action for session

post '/logout' do
	session.destroy
	redirect "/"
end
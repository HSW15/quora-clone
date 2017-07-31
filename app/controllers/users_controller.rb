# Create- create
post '/users' do
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


# Read- show
get '/users/:id' do
	if current_user.id == params[:id].to_i
		@user = User.find(current_user.id)
		erb :"users/show"
	else
		redirect '/'
	end
end

#Update - edit do
get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :"users/edit"
end

#Update - update do
patch '/users/:id' do
	@user = User.find(params[:id])
	if @user.update(params[:user])
		redirect "/users/#{@user.id}"
	else
		erb :"users/edit"
	end

end

delete '/users/:id' do
	@user = User.find(params[:id])
	@user.destroy
	redirect "/"

end
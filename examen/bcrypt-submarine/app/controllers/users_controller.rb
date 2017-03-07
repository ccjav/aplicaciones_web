# GETS ============================================

get '/signup' do
	erb :signup
end


# POSTS ============================================

post '/signup' do
	@user = User.new(name: params[:name], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect to ("/secret")
  else
    @error_name = @user.errors.messages[:name]
    @error_email = @user.errors.messages[:email]
    @error_password = @user.errors.messages[:password]
    redirect '/signup'
  end
end
# GETS ============================================

get '/signin' do
	erb :signin
end

get '/logout' do
  session.clear
  redirect '/'
	
end

# POSTS ============================================

post '/signin' do
  @user = User.authenticate(params[:email], params[:password])
  
	if @user
  	session[:user_id] = @user.id
    redirect to ("/secret")
  else
  	"errores"
  end

end

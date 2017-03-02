get '/sign_in' do
  redirect request_token.authorize_url(:oauth_callback => "http://#{host_and_port}/auth")
end

get '/auth' do
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  session.delete(:request_token)
  @user = TwitterUser.new(twitter_handles: @access_token.params[:screen_name], oauth_token: @access_token.params[:oauth_token], oauth_token_secret: @access_token.params[:oauth_token_secret])
  if @user.save
    session[:user_id] = @user.id
    redirect to ("/")
  end
end

get '/sign_out' do
  session.clear
  redirect to ("/")
end
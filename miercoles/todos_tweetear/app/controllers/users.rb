get '/sign_in' do
  # El método `request_token` es uno de los helpers
  # Esto lleva al usuario a una página de twitter donde sera autentificado con sus credenciales

  redirect request_token.authorize_url(:oauth_callback => "http://#{host_and_port}/auth")

  # Cuando el usuario otorga sus credenciales es redirigido a la callback_url 
  # Dentro de params twitter regresa un 'request_token' llamado 'oauth_verifier'
end

get '/auth' do
  # Volvemos a mandar a twitter el 'request_token' a cambio de un 'access_token' 
  # Este 'access_token' lo utilizaremos para futuras comunicaciones.   

  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  
  # Despues de utilizar el 'request token' ya podemos borrarlo, porque no vuelve a servir. 
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
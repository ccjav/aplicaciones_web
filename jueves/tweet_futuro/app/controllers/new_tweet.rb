post '/tweet' do

  if logged_in?
    $client.access_token=@current_user.oauth_token
    $client.access_token_secret=@current_user.oauth_token_secret
    $client.update(params[:tweet])
    last_tweet = $client.user_timeline(@current_user.twitter_handles, count: 1)
    if last_tweet[0].full_text == params[:tweet]
      "Éxito"
    else
      "Error"
    end
  else
    "Debe iniciar sesión"
  end
  
end
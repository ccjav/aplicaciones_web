post '/tweet' do
  if logged_in?
    # @current_user.tweet(params[:tweet])
    @current_user.tweet_later(params[:tweet], params[:time].to_i, params[:time_unit])
  else
    "Debe iniciar sesión"
  end 
end
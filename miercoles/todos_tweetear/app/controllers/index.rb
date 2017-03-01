before '/' do
  if logged_in?
    @session = @current_user
  end
end

get '/' do
  # session.clear
  # puts "current user"
  # p @current_user.oauth_token
  # p $client.methods
  p $client
  # p "session es #{@session}"
  # current_user
  # p "current user es #{@current_user}"
  # p @session
  # p session
  # p @current_user
  # p ENV
  erb :index
end
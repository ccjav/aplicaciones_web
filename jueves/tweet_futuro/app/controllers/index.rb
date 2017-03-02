before '/' do
  if logged_in?
    @session = @current_user
  end
end

get '/' do
  erb :index
end
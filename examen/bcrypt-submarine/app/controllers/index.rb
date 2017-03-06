before '/secret' do 
  pass if session[:user_id]
  redirect '/'
end 

get '/' do
  erb :index
end

get '/secret' do
  @user = User.find(session[:user_id])
  erb :secret
end

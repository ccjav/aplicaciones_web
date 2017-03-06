get '/score/:user_id' do
  #¿Qué va en esta parte para obtener la puntuación de cada jugador (submarinos destruidos en cada ronda) y
  #número de juegos ganados?+
  @user = User.find(session[:user_id])
  @rounds = Game.where(user_id: session[:user_id])
  erb :round
end

post '/games' do
  #¿Qué va en esta parte para recibir la información del round actual, el score del jugador, el conteo de las
  #oportunidades de cada jugador, así como la sesión actual?

  #¿Qué va en esta parte para llevar el registro de las puntuaciones por ronda?
  if params[:score] == "2"
    win = true
  else
    win = false  
  end
  due = Game.new(user_id: session[:user_id], destroyes_subs: params[:score], win: win)
  due.save!
end

post '/new_game' do
  #¿Qué va en esta parte para redirigir a secret?
 
end

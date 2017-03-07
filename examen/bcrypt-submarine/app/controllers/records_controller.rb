get '/records' do
  #¿Qué va en esta parte para obtener la lista de ganadores (juegos ganados)? Ordenados en orden descendente
  @users = User.all
  @winners = {}
  @users.each do |user|
  	@winners["#{user.name}"] = user.games.where(win: "Winner!").count
  end
  @records = @winners.sort_by{|k,v| v}.reverse.to_h
  p @records
  	def round_won
  		Game.where(win: "Winner!")

  	end
	erb :record
end
def current_user
  if session[:user_id]
    @current_user ||= TwitterUser.find_by_id(session[:user_id])
  end
end

def logged_in?
  !current_user.nil?
end

def oauth_consumer
  raise RuntimeError, "Debes configurar una CONSUMER_KEY y CONSUMER_SECRET en tu yaml file y environment." unless ENV['CONSUMER_KEY'] and ENV['CONSUMER_SECRET']
  @consumer ||= OAuth::Consumer.new(
    ENV['CONSUMER_KEY'],
    ENV['CONSUMER_SECRET'],
    :site => "https://api.twitter.com"
  )
end

def host_and_port
    # En este método creamos la base de nuestra 'calback url' de la app 
    # para funcionar tanto local como en producción 
    # Esta línea toma de una variable de la petición (creada por sinatra) la url.  
    host_and_port = request.host
    # Si estamos desarrollando localmente necesitamos agregar el puerto 
    host_and_port << ":#{request.port}" if request.host == "localhost"
    host_and_port
end


def request_token

  unless session[:request_token]

    # A una instancia de OAuth::Consumer llamamos el método get_request_token
    # Esto hace una petición http a la API de Twitter mandando como argumento la 'calback url' y las 'consumer keys'
    # La petición nos regresa un 'request_token' 
    # Este token contiene una url donde se llevará acabo la autenticación del usuario 
    # Esta url la guardamos en la sesión para no perderla. 
    session[:request_token] = oauth_consumer.get_request_token(
      :oauth_callback => "http://#{host_and_port}/auth"
    )
  end
  session[:request_token]
end
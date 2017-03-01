post '/tweet' do
  $client.update(params[:tweet])
  last_tweet = $client.user_timeline("cjavv", count: 1)
  if last_tweet[0].full_text == params[:tweet]
    "Éxito"
  else
    "Error"
  end
end
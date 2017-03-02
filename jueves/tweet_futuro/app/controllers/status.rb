get '/status/:job_id' do
  jid = params[:job_id]
  if job_is_complete(jid)
    "Tweet listo"
  else
    "Tweeteando..."
  end
end
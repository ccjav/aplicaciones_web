def job_is_complete(jid)
  p "job"
  # Revisa si la tarea se encuentra pendiente
  pending = Sidekiq::ScheduledSet.new
  return false if pending.find { |job| job.jid == jid }
  # Revisa si la tarea se encuentra en la cola 
  waiting = Sidekiq::Queue.new 
  return false if waiting.find { |job| job.jid == jid }
  # Revisa si la tarea se encuentra en proceso 
  working = Sidekiq::Workers.new
  return false if working.find { |worker, info| info["payload"]["jid"] == jid }
  # Si no se cumplió ninguna de las anteriores entonces la tarea ya fue procesada.  
  true
end


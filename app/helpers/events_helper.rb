module EventsHelper

  def verify_register
    (session[:user_id] == @event.creator_id) || (@event.date < Time.now)
  end
  
end

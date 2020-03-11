module EventsHelper
  def valid_register
    (session[:user_id] == @event.creator_id) || (@event.date < Time.now)
  end

  def past_or_future
    @event.date > Time.now ? 'from now' : 'ago'
  end
end

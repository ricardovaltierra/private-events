module ApplicationHelper
  attr_accessor :registered

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def registered?(user)
    @registered ||= @event.attendees.exists?(user.id)
  end
end

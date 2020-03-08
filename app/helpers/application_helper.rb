module ApplicationHelper
    attr_accessor :registered

    def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
      end
    end

    def registered?(user)
      @registered ||= @event.attendees.exists?(user.id)
    end
end

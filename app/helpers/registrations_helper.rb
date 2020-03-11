module RegistrationsHelper
  def attend(event)
    if event && !registered?(current_user)
      if current_user.id != event.creator_id
        event.attendees << current_user
        @registered = true
      end
    end
    redirect_to event_path(@event)
  end

  def unattend(event)
    if event && registered?(current_user)
      @event.attendees.delete(current_user.id)
      @registered = nil
    end
    redirect_to event_path(@event)
  end
end

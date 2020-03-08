class RegistrationsController < ApplicationController
  
  def create
    @event = Event.find_by(id: params[:registrations][:event_id])
    attend(@event)
  end

  def destroy
    @event = Event.find_by(id: params[:registrations][:event_id])
    unattend(@event)
  end
end

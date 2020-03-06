class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    #@event = current_user.created_events.build
  end

  def show
  end
end

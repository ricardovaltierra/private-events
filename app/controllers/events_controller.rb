class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event.id)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees.all
  end

  def attend
    @event = Event.find(params[:event][:event_id])
    if current_user.attended_events.find_by_id(@event.id)
      redirect_to event_path(@event)
    else
      current_user.attended_events << @event
      redirect_to event_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :content, :date)
  end
end

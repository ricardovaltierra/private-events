class EventsController < ApplicationController
  
  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
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
    registered?(current_user) ? @attending = false : @attending = true
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :content, :date)
  end
end

class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
    @mythology = Mythology.find(@event.mythology_id)
  end
end
class EventsController < ApplicationController
  def index
    @events = Deity.all
  end
  
  def show
    @event = Deity.find(params[:id])
  end
end
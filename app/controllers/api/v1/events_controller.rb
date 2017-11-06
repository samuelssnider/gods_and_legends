module Api
  module V1
    class EventsController < ActionController::API
      def index
        @events = Event.all
        render json: @events
      end
      
      def show
        @event = Event.find(params[:id])
        render json: @event
      end
    end
  end
end
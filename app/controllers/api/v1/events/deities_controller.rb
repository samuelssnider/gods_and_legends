module Api
  module V1
    module Events
      class DeitiesController < ActionController::API
        def index
          @event = Event.find(params[:event_id])
          @deities = @event.deities
          render json: @deities
        end
      end
    end
  end
end
module Api
  module V1
    module Deities
      class EventsController < ActionController::API
        def index
          @deity = Deity.find(params[:deity_id])
          @events = @deity.events
          render json: @events
        end
      end
    end
  end
end
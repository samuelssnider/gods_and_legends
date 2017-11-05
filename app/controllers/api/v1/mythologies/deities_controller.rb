module Api
  module V1
    module Mythologies
      class DeitiesController < ActionController::API
        def index
          @mythology = Mythology.find(params[:mythology_id])
          @deities = @mythology.deities
          render json: @deities
        end
      end
    end
  end
end
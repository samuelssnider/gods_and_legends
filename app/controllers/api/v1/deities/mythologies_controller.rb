module Api
  module V1
    module Deities
      class MythologiesController < ActionController::API
        def index
          @deity = Deity.find(params[:deity_id])
          @mythology = @deity.mythology
          render json: @mythology
        end
      end
    end
  end
end
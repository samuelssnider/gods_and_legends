module Api
  module V1
    module Deities
      class ParentsController < ActionController::API
        def index
          @deity = Deity.find(params[:deity_id])
          @parents = @deity.parents
          render json: @parents
        end
      end
    end
  end
end
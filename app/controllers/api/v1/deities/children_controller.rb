module Api
  module V1
    module Deities
      class ChildrenController < ActionController::API
        def index
          @deity = Deity.find(params[:deity_id])
          @children = @deity.children
          render json: @children
        end
      end
    end
  end
end
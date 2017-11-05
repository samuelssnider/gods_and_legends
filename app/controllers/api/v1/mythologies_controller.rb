module Api
  module V1
    class MythologiesController < ActionController::API
      def index
        @mythologies = Mythology.all
        render json: @mythologies
      end
      
      def show
        @mythology = Mythology.find(params[:id])
        render json: @mythology
      end
    end
  end
end

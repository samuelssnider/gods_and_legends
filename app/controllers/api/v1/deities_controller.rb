module Api
  module V1
    class DeitiesController < ActionController::API
      def index
        render json: Deity.all
      end
      
      def show
        @deity = Deity.find(params[:id])
        render json: @deity
      end
    end
  end
end
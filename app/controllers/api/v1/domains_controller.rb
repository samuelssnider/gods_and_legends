module Api
  module V1
    class DomainsController < ActionController::API
      def index
        render json: Domain.all
      end
      
      def show
        @domain = Domain.find(params[:id])
        render json: @domain
      end
    end
  end
end
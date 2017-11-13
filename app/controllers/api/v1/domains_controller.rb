module Api
  module V1
    class DomainsController < ApplicationController
      def index
        render json: Domain.all
      end
      
      def show
        @domain = Domain.find(params[:id])
        render json: @domain
      end
    end
    
    def create
      @domain =  Domain.new(domain_params)
      if @domain.save
        render json: @domain, status: :created
      else
        render @domain.errors, status: :unprocessable_entity
      end
    end
    
    
    private
      def domain_params
        params.permit(:name)
      end
      
  end
end
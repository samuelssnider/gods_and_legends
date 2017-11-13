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
    
      def create
        @domain =  Domain.new(domain_params)
        if @domain.save
          render json: @domain, status: :created
        else
          render  body: "Unable to create domain- make sure it has a name, and that name is unique."
        end
      end
      
      def update
        @domain = Domain.find(params[:id])
        if @domain.update(domain_params)
          render json: @domain, status: :updated
        else
          render  body: "Unable to update domain- make sure it has a name, and that name is unique."
        end
      end
        
    
    
      private
        def domain_params
          params.permit(:name)
        end
    end
  end
end
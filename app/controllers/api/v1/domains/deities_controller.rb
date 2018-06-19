module Api
  module V1
    module Domains
      class DeitiesController < ActionController::API
        def index
          @domain = Domain.find(params[:domain_id])
          @deities = @domain.deities
          render json: @deities
        end
      end
    end
  end
end
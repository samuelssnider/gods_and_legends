module Api
  module V1
    module Deities
      class DomainsController < ActionController::API
        def index
          @deity = Deity.find(params[:deity_id])
          @domains = @deity.domains
          render json: @domains
        end
      end
    end
  end
end
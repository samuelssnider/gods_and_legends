class DomainsController < ApplicationController
  def index
    @domains = Domain.all
  end
  
  def show
    @domain = Domain.find(params[:id])
  end
end

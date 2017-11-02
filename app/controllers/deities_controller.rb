class DeitiesController < ApplicationController
  def index
    @deities = Deity.all
  end
  
  def show
    @deity = Deity.find(params[:id])
  end
end
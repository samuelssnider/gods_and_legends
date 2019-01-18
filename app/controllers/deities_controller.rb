class DeitiesController < ApplicationController
  def index
    unless params["mythology"] 
      @deities = Deity.all
    else
      @deities = Deity.where(mythology: Mythology.find_by(name: params["mythology"]))
    end
  end
  
  def show
    @deity = Deity.find(params[:id])
  end
end
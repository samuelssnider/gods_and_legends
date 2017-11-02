class MythologiesController < ApplicationController
  def index
    @mythologies = Mythology.all
  end
  
  def show
    @mythology = Mythology.find(params[:id])
  end
end
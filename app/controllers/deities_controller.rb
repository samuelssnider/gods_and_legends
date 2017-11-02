class DeitiesController < ApplicationController
  def index
    @deities = Deity.all
  end
end
module Mythologies
  class DeitiesController < ApplicationController
    def index
      @mythology = Mythology.find_by(name: params["name"].capitalize)
      binding.pry
      @deities = @mythology.deities
    end
  end
end
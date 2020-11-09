class ChartersController < ApplicationController
  def index
    @charters = Charter.all
  end
  def new
    @charter = Charter.new
  end

  def create
    @charter = Charter.create(params)
  end
end

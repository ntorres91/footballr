class LocationsController < ApplicationController
  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50, order: distance)
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    @location.save
    redirect_to @location, notice: "Location Created!"
  end
end

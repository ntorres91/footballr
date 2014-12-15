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

    if @location.save
      redirect_to @location, notice: "Location Created!"
    else
      render :new
    end
  end
end

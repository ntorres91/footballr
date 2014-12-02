class FieldsController < ApplicationController

  def create
    @borough = Borough.find(params[:borough_id])
    @field = Field.new(borough_params)
    @field.borough_id = @borough.id
    @borough.save
    redirect_to
  end

  def new
    @borough = Borough.find(params[:borough_id])
    @field = Field.new
  end

  def show
  end

private

  def borough_params
    params.require(:field).permit(:name)
  end
end

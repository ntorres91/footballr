class BookingsController < ApplicationController
  before_action :event, only: [:new, :create, :show]

  def new
    @booking = Booking.new
  end

  def create

    @booking = event.bookings.create(booking_params)
    if @booking.save
      redirect_to [event, @booking]
    else
      render :new
    end
  end

  def show
    @booking = event.bookings.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:email, :username, :address)
    end

    def event
      Event.find(params[:event_id])
    end
  end

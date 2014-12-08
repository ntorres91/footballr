class BookingsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @booking = Booking.new
  end

  def create
    @event = Event.find(params[:event_id])
    @booking = @event.bookings.create(booking_params)
    if @booking.save
      redirect_to [@event, @booking]
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:event_id])
    @booking = @event.bookings.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:email, :username, :address)
    end
  end

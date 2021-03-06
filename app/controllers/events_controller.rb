class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    @event = Event.find params[:id]
    if @event.update_attributes(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def nearby
    @events = Event.near([current_user.latitude, current_user.longitude], 10)
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end

  def show
    @event = Event.find(params[:id])
  end

  def join_game
    @event = Event.find(params[:event_id])
    @event.add_player(current_user)
    redirect_to event_path(@event)
  end

  def leave_game
    @event = Event.find(params[:event_id])
    @event.player_left(current_user)
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :starts_at, :ends_at, :description, :address)
  end
end

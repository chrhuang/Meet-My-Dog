class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    authorize @event
    @user_in_event = user_in_event?
    @eventhasuser = EventHasUser.find_by(event_id: @event, user_id: current_user)
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    @event.walk_id = params["event"]["walk_id"]
    if @event.save
      @event_has = EventHasUser.create!(event: @event, user: current_user)
      redirect_to event_path(@event)
    else
      render sites_path
    end
  end

  def join
    event = Event.find(params[:id])
    authorize event
    EventHasUser.create!(event: event, user: current_user)
    redirect_to event_path(event)
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @eventhasuser = EventHasUser.find_by(event_id: @event, user_id: current_user)
    @eventhasuser.destroy
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :max_dog, :date)
  end

  def user_in_event?
    current_user.events.include? @event
  end
end

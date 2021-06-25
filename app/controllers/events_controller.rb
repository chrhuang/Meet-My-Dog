class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    authorize @event
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

  private

  def event_params
    params.require(:event).permit(:name, :description, :max_dog)
  end
end

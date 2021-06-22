class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def create
  end
end

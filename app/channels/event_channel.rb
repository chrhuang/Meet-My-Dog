class EventChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    current_user.events.each do |event|
      stream_for event
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

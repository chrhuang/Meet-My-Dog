class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    authorize message
    message.user = current_user
    # message.date = Date.now
    message.event_id = params["message"]["event"]
    message.save!
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    event = Event.find(params["message"]["event"])
    authorize message
    message.user = current_user
    message.event = event
    message.save!
    EventChannel.broadcast_to(
      event,
      render_to_string(partial: "message", locals: { message: message, current: current_user == message.user })
    )
    # redirect_to root_path #Je sais pas quoi mettre ici
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

class ChatController < ApplicationController
  def create
    this_message = Message.create(sender: current_user.first_name, message: params["message"], trip_id: params["trip_id"])

    Pusher.trigger("my-channel", "my-event", {
      sender: this_message.sender,
      message: this_message.message,
      trip_id: this_message.trip_id,
      updated_at: this_message.updated_at,
    })
  end
end

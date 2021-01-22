class MessageController < ApplicationController
  def index
    @user = current_user
    @messages = Message.where(receiver_id: @user.id)
  end

  def create
    @user = current_user
    message = Message.create(message_params)
    message.sender = @user
    message.save
    redirect_to action: "index"
  end


  def message_params
    params.require(:message).permit(:message, :receiver_id )
  end
end

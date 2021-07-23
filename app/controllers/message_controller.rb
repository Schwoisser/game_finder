class MessageController < ApplicationController
  def index
    @user = current_user
    @friend_list = FriendList.new
    #  @messages = Message.where(receiver_id: @user.id)
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

  def answer_friend_request
    friend_list = FriendList.where(inviting_user_id: friend_request_params[:inviting_user_id], receiving_user_id: current_user.id).first
    friend_list.status = friend_request_params[:status]
    friend_list.save
  end

  def friend_request_params
    params.require(:friend_list).permit(:inviting_user_id, :status)
  end
end

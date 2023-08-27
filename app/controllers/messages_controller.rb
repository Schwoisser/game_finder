class MessagesController < ApplicationController

  def show
    unless params[:id]
      @user = current_user
      @friend_list = FriendList.where(inviting_user: current_user, status: :accepted).or(FriendList.where(receiving_user: current_user, status: :accepted))
      @friend_list_users = []
      @tab = params[:tab]
      @friend_list.each do |friend|
        if friend.inviting_user != current_user
          @friend_list_users << friend.inviting_user
        else
          @friend_list_users << friend.receiving_user
        end
      end
      @friend_invites = FriendList.where(receiving_user: current_user, status: :sent)
      # TODO FriendList + Last Message (tuples)
      # link auf messages new mit user id
      # message / user_id -> alles nachrichten mit dem user
      # + message new form
    else
      @user = User.find(params[:id])
    end

    @player_attribute_count = PlayerAttributeCount.where(user: @user).order(votes: :desc).first
    if @player_attribute_count
      @player_attribute = PlayerAttribute.find(@player_attribute_count.player_attribute_id)
      @player_attribute_title = @player_attribute.title
    else
      @player_attribute_title ="none yet"
    end
  end
  

  def index
    @user = current_user
    @friend_list = FriendList.new
    #  @messages = Message.where(receiver_id: @user.id)
  end

  def send_to
    @message = Message.new()
    @receiving_user = User.find(params[:id])

    @messages = Message.where(sender: current_user, receiver: @receiving_user).or(Message.where(sender: @receiving_user, receiver: current_user)).order('created_at asc')
    @messages.each do |message|
      message.unread = false
      message.save
    end
  end

  def create
    #TODO check if Friend
    @user = current_user
    message = Message.create(message_params)
    message.sender = @user
    message.save
    #redirect_to action: "index"

    @message = Message.new()
    @receiving_user = User.find(message_params[:receiver_id])
    @messages = Message.where(sender: current_user, receiver: @receiving_user).or(Message.where(sender: @receiving_user, receiver: current_user)).order('created_at asc')

    @receiving_user.broadcast_action :append, target: "messages", partial: "messages/message", locals: {message: message}

    # turbo_stream.append("messages_user_#{@receiving_user.id}", partial: "messages/message", locals: { message: @message })

    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: )
    #   end

    #   format.html { }
    # end
    render "send_to" 
    
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

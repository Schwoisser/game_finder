class ProfileController < ApplicationController
  include Geokit::Geocoders
  
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

  def edit
    @user = current_user
  end 

  def update
    @user = current_user
    @user.update(user_params)

    res = OSMGeocoder.geocode("#{user_params[:street]}, #{user_params[:zip]}, #{user_params[:city]}, #{user_params[:country]}")

    @user.longitude = res.lng
    @user.latitude = res.lat
    @user.save

    redirect_to "/profile"
  end

  def new
    # @user = current_user
  end

  def create
    # @user = current_user
  end

  def add_game
    @user = current_user
    game = Game.where(id: add_game_params[:games]).first
    unless current_user.games.include? game
      current_user.games += [game]
    end
    render "edit"
  end

  def remove_game
    @user = current_user
    game = Game.find(params[:id])
    if current_user.games.include? game
      current_user.games.delete game
    end
    render "edit"
  end

  def add_language
    @user = current_user
    Rails.logger.info params
    Rails.logger.info add_language_params
    language = Language.find(add_language_params[:languages])
    Rails.logger.info language.inspect
    unless current_user.languages.include? language
      current_user.languages += [language]
      Rails.logger.info current_user.inspect
      current_user.save
      render "edit"
    end
    # render "edit"
  end

  def remove_language
    @user = current_user
    language = Language.find(params[:id])
    if current_user.languages.include? language
      current_user.languages.delete language
    end
    render "edit"
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nick_name, :longitude, :latitude, :info, :image, :street, :zip, :city, :country  )
  end


  def add_game_params
    params.require(:user).permit(:games)
  end

  def remove_game_params
    params.require(:user).permit(:game_id)
  end


  def add_language_params
    params.require(:user).permit(:languages)
  end

  def remove_language_params
    params.require(:user).permit(:language_id)
  end



  def send_friend_request
    @receiving_user = User.find(friend_request_params[:receiving_user_id])
    invite_summ = FriendList.where(inviting_user_id: current_user.id, receiving_user_id: @receiving_user.id).size
    receive_summ = FriendList.where(receiving_user_id: current_user.id, inviting_user_id: @receiving_user.id).size
    if 0 == (invite_summ + receive_summ)
      FriendList.create!(inviting_user: current_user, receiving_user: @receiving_user, message: friend_request_params[:message])
    end  
    redirect_to "/profile/" + @receiving_user.id.to_s
  end

  def friend_request_params
    params.require(:friend_list).permit(:receiving_user_id, :message)
  end
end

class ProfileController < ApplicationController
  
  def show
    unless params[:id]
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

  def edit
    @user = current_user
  end 

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to action: "show", id: @user.id
  end

  def new
    # @user = current_user
  end

  def create
    # @user = current_user
  end

  def add_game
    game = Game.find(add_game_params[:games])
    unless current_user.games.include? game
      current_user.games += [game]
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nick_name, :longitude, :latitude )
  end
  def add_game_params
    params.require(:user).permit(:games )
  end
end

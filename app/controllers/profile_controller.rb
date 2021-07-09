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
    @user = current_user
    game = Game.find(add_game_params[:games])
    unless current_user.games.include? game
      current_user.games += [game]
      render "show"
    end
  end

  def remove_game
    @user = current_user
    game = Game.find(remove_game_params[:game_id])
    if current_user.games.include? game
      current_user.games.delete game
    end
    render "show"
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nick_name, :longitude, :latitude )
  end
  def add_game_params
    params.require(:user).permit(:games)
  end

  def remove_game_params
    params.require(:user).permit(:game_id)
  end

end

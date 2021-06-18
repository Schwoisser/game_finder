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

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nick_name, :longitude, :latitude )
  end
end
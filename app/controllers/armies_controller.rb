class ArmiesController < ApplicationController
  def index
    @armies = Army.all
  end

  def show
    @army = Army.find(params[:id])
  end


  def new
    @army = Army.new
  end

  def create
    @user = current_user
    army = Army.create(army_params)
    army.user = @user
    army.save
    redirect_to action: "index"
  end

  def edit
  end

  def update
  end

  def delete
  end

  def army_params
    params.require(:player_group).permit(:game_id, :title, :description )
  end
end

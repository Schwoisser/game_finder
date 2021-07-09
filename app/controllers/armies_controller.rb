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
    @army = Army.find(params[:id])
  end

  def update
    @army = Army.find(params[:id])
    if current_user.armies.include? @army
      @army.update(army_params)
    end
    redirect_to action: "show", id: @army.id
  end

  def delete
  end

  def army_params
    params.require(:army).permit(:game_id, :title, :army_list, :army_faction )
  end
end

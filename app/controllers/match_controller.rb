class MatchController < ApplicationController
  def index
    @matches = Match.all # where games in user.games
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @user = current_user
    @match = Match.new
  end

  def create
    match = Match.create(match_params)
    redirect_to action: "show", id: match.id
  end


  def update

  end

  private

  def match_params
    params.require(:match).permit(:title, :description, :game_id)
  end
end

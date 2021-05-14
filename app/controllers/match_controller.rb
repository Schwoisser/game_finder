class MatchController < ApplicationController
  def index
    # TODO inform the user that he has no location
    begin
      nearest_users = User.within(20, :origin => current_user)
      @matches = Match.where(user: nearest_users) # where games in user.games
    rescue => e 
      @matches = Match.all
    end
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

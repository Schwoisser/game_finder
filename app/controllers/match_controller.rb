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

  def edit
    @match = Match.find(params[:id])
    render "edit"
  end

  def update
    @match = Match.find(params[:id])
    @match.update(match_params)
  end

  def match_scoring
    # TODO check Authorization
    @match_scoring = MatchScoring.find(match_scoring_params[:match_scoring_id])
    @match_scoring.match_score = match_scoring_params[:match_score]
    @match_scoring.save
    @tournament = Tournament.find(match_scoring_params[:tournament_id])
    @match = Match.find(match_scoring_params[:match_id])
    render :partial => 'tournaments/match_scoring_form', locals: { tournament: @tournament, user: current_user, match: @match }
  end

  private

  def match_params
    params.require(:match).permit(:title, :description, :game_id, users:[])
  end
  def match_scoring_params
    params.require(:match_scoring).permit(:tournament_id, :match_id, :match_scoring_id, :user_id, :match_score)
  end
end

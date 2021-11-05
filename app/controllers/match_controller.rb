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
    @users = User.within(20, :origin => current_user)
    @match = Match.new
  end

  def create
    match_stuff = match_params
    match_scorings = match_params[:match_scorings]
    match_stuff.delete(:match_scorings)
    match_scorings.delete("")

    match = Match.new(match_stuff)
    if match_scorings.size > 2
      match.status = "open"
    end
    match.user = current_user
    match.save
    
    match_scorings.each do |user_id|
      MatchScoring.create(user_id: user_id.to_i, match: match)
    end
    MatchScoring.create(user: current_user, match: match, accepted: true)

    redirect_to action: "show", id: match.id
  end

  def edit
    @match = Match.find(params[:id])
    @users = User.within(20, :origin => current_user)
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

  def invite
    @user = current_user
    @invited_user = User.find(params[:id])
    @users = User.within(20, :origin => current_user)
    @users << @invited_user unless @users.include? @invited_user
    @match = Match.new
    @match.max_player_number = 2
    @match.status = "closed"
    @match_scorings = [MatchScoring.new(user: @user, accepted: true), MatchScoring.new(user: @invited_user)]
    render "new"
  end

  private

  def match_params
    params.require(:match).permit(:title, :description, :game_id, :max_player_number, :start_date, :status, match_scorings:[], users:[])
  end

  def match_scoring_params
    params.require(:match_scoring).permit(:tournament_id, :match_id, :match_scoring_id, :user_id, :match_score)
  end
end

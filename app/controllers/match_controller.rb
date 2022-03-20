class MatchController < ApplicationController
  include Geokit::Geocoders

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

    res = OSMGeocoder.geocode("#{match_stuff[:street]}, #{match_stuff[:zip]}, #{match_stuff[:city]}, #{match_stuff[:country]}")

    match.longitude = res.lng
    match.latitude = res.lat

    if match_scorings.size > match_stuff[:max_player_number].to_i
      match.status = "open"
    else
      match.max_player_number = match_scorings.size + 1 # +1 for host
    end
    match.user = current_user
    match.save
    
    match_scorings.each do |user_id|
      MatchScoring.create(user_id: user_id.to_i, match: match)
    end
    MatchScoring.create(user: current_user, match: match, accepted: true)

  end

  def edit
    @match = Match.find(params[:id])
    unless @match.user == current_user
      return
    end
    @current_users = @match.users.filter {|u| u != current_user}
    @users = User.within(20, :origin => current_user).filter {|u| u != current_user} - @current_users
    render "edit"
  end

  def update
    match_stuff = match_params
    match_scorings = match_params[:match_scorings]
    match_stuff.delete(:match_scorings)
    match_scorings.delete("") if match_scorings

    Rails.logger.info  match_scorings_params[:match_scorings_current]
    Rails.logger.info  match_scorings_current_params
    edited_match_scorings = match_scorings_params[:match_scorings_current].filter {|user_id| user_id != ""}.map{|user_id| user_id.to_i}
    Rails.logger.info edited_match_scorings
    @match = Match.find(params[:id])
    unless @match.user == current_user
      return
    end
    @match.update(match_stuff)
    redirect_to "/match/#{@match.id}"
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

    # Find other users to invite
    @users = User.within(20, :origin => current_user).first(11).filter {|u| u != current_user}
    @users += [@invited_user] unless @users.include? @invited_user

    @match = Match.new
    @match.max_player_number = 2
    @match.status = "closed"
    @match_scorings = [MatchScoring.new(user: @user, accepted: true), MatchScoring.new(user: @invited_user)]
    render "new"
  end

  def accept_invite
    @user = current_user
    @match_scoring = MatchScoring.find(params[:id])
    if @match_scoring.user == @user
      @match_scoring.accepted = true
      @match_scoring.save
    end
    redirect_to "/"
  end

  def decline_invite
    @user = current_user
    @match_scoring = MatchScoring.find(params[:id])
    if @match_scoring.user == @user
      @match_scoring.delete
      # @match_scoring.save
    end
    redirect_to "/"
  end

  private

  def match_params
    params.require(:match).permit(:title, :description, :game_id, :max_player_number, :start_date, :status, :longitude, :latitude, :address, :street, :zip, match_scorings:[], users:[])
  end

  def match_scoring_params
    params.require(:match_scoring).permit(:tournament_id, :match_id, :match_scoring_id, :user_id, :match_score)
  end

  def match_scorings_params
    params.require(:match).permit(:match_scorings)
  end
  def match_scorings_current_params
    params.require(:match).permit(:match_scorings_current)
  end
end

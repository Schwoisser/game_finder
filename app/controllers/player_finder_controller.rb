class PlayerFinderController < ApplicationController
  def index

    # TODO get game system oarams if there otherise current_user. games.first
    @selected_game, @user_games = false, false

    if params[:id]
      Rails.logger.info(params[:id])
      @selected_game = Game.find(params[:id].to_i)
      @test ="with params id"
    else
      @user_games = current_user.games
    end
    Rails.logger.info(@selected_game)
    @users = User.joins(:games).where(games: @user_games || [@selected_game]).by_distance(:origin => current_user)[1..13] || []
    @matches = Match.where(games: @user_games || [@selected_game], status: "open").by_distance(:origin => current_user)[1..13] || []
    Rails.logger.info(@users)
    @users = @users.excluding(current_user)
    Rails.logger.info(@matches)
    # # Turbo stream response or html
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end
end
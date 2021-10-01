class PlayerFinderController < ApplicationController
  def index

    # TODO get game system oarams if there otherise current_user. games.first
    if params[:id]
      Rails.logger.info(params[:id])
      selected_game = Game.find(params[:id].to_i)
      @test ="with params id"
    else
      selected_game = current_user.games.first
    end
    Rails.logger.info(selected_game)
    @users = User.joins(:games).where(games: [selected_game]).by_distance(:origin => current_user)[1..13] || []
    @matches = Match.where(game: selected_game).by_distance(:origin => current_user)[1..13] || []
    Rails.logger.info(@users)
    Rails.logger.info(@matches)
    # # Turbo stream response or html
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end
end
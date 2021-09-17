class PlayerFinderController < ApplicationController
  def index
    @users = User.by_distance(:origin => current_user)[1..13]
    @matches = Match.by_distance(:origin => current_user)[1..13]
  end
end
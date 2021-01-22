class TournamentController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @user = current_user
    tournament = Tournament.create(tournament_params)
    tournament.organizer = @user
    tournament.save
    redirect_to action: "index"
  end

  def edit
  end

  def update
  end

  def show
  end

  def tournament_params
    params.require(:tournament).permit(:start_date, :title, :description )
  end

end

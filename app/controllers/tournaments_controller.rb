class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end


  def new
    @tournament = Tournament.new
  end

  def create
    @user = current_user
    tournament = Tournament.create(tournament_params)
    tournament.organizer = @user
    tournament.save
    Rails.logger.info(tournament.errors.full_messages)
    redirect_to action: "index"
  end

  def edit
  end

  def update
  end

  def delete
  end

  def join
    tournament = Tournament.find(tournament_id_params[:tournament_id])
    unless tournament.users.include?(current_user)
      tournament.users << current_user
      tournament.save
    end
  end

  def leave
    tournament = Tournament.find(tournament_id_params[:tournament_id])
    if tournament.users.include?(current_user)
      tournament.users.delete current_user
      tournament.save
    end
  end

  def pair
    @tournament = Tournament.find(tournament_id_params[:tournament_id])
    if @tournament.organizer == current_user
      puts @tournament.users
      puts "##" * 10
      shuffeld_users = @tournament.users.shuffle
      while shuffeld_users.length > 0
        user_one = shuffeld_users.pop
        user_two = shuffeld_users.pop unless shuffeld_users.length == 0
        match = Match.new(
          title: user_one.full_name + " vs " + user_two.try(:full_name).to_s,
          description: "",
          game_id: @tournament.game.id,
          tournament_id: @tournament.id,
          tournament_round: @tournament.current_round + 1,
        )
        match.users << user_one
        match.users << user_two if user_two
        puts match.save
        puts match.tournament_id
        puts @tournament.matches
      end
      # byebug
    end
  end

  def start_round
    @tournament = Tournament.find(tournament_id_params[:tournament_id])
    if tournament_ready_for_new_round?(@tournament)
      @tournament.current_round += 1
      @tournament.save
    end
  end

  def tournament_ready_for_new_round?(tournament)
    tournament.organizer == current_user && 
    (Match.where(tournament: tournament, tournament_round: tournament.current_round + 1).count > 0) && 
    tournament.current_round < tournament.max_number_of_rounds
  end

  def tournament_params
    params.require(:tournament).permit(:start_date, :title, :description, :gamesystem )
  end

  def tournament_id_params
    params.require(:tournament).permit(:tournament_id)
  end


end

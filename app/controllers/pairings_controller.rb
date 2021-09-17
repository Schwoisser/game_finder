class PairingsController < ApplicationController
  def index
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.find(params[:tournament_id])
    @match = Match.new(tournament: @tournament)
  end

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @match = Match.new(match_params)

    @match.tournament = @tournament
    @match.game = @tournament.game
    @match.tournament_round = @tournament.current_round + 1

    Rails.logger.info(@match.errors.full_messages)
    if @match.save
      @match = false
      redirect_to "/tournaments/#{@tournament.id}/edit_pairing"
    else
      render :partial => 'new', locals: { tournament: @tournament, match: @match }
    end
  end

  def show
    @tournament = Tournament.find(params[:tournament_id])
    @match = Match.find(params[:match_id])
    render :partial => 'show', locals: { tournament: @tournament, match: @match }
  end

  def edit
    @tournament = Tournament.find(params[:tournament_id])
    @match = Match.find(params[:match_id])
    render :partial => 'form', locals: { tournament: @tournament, match: @match }
  end

  def update
    @tournament = Tournament.find(params[:tournament_id])
    @match = Match.find(params[:match_id])
    @match.update(match_params)
    ## TODO Fix Edit Link in Partial if performance needs it
    # render :partial => 'show', locals: { tournament: @tournament, match: @match }
    redirect_to "/tournaments/#{@tournament.id}/edit_pairing"
  end

  def delete
    @tournament = Tournament.find(params[:tournament_id])
    @match = Match.find(params[:match_id])
    @match_id = @match.id
    @match.destroy
    render :partial => 'delete', locals: { tournament: @tournament, match_id: @match_id }
  end

  def pair
    @tournament = Tournament.find(params[:tournament_id])
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
      redirect_to "/tournaments/#{@tournament.id}/edit_pairing"
    end
  end

  def start_round
    @tournament = Tournament.find(tournament_id_params[:tournament_id])
    if tournament_ready_for_new_round?(@tournament)
      @tournament.current_round += 1
      @tournament.round_started = true
      @tournament.round_started_at = DateTime.now
      @tournament.save
      redirect_to "/tournaments/#{@tournament.id}/edit_pairing"
    end
  end


  def end_round
    @tournament = Tournament.find(tournament_id_params[:tournament_id])
    @tournament.round_started = false
    @tournament.save
    redirect_to "/tournaments/#{@tournament.id}/edit_pairing"
  end

  def end_tournament
    @tournament = Tournament.find(tournament_id_params[:tournament_id])
    @tournament.ended = true
    @tournament.save
    redirect_to "/tournaments/#{@tournament.id}/edit_pairing"
  end

  private

  def tournament_ready_for_new_round?(tournament)
    tournament.organizer == current_user && 
    (Match.where(tournament: tournament, tournament_round: tournament.current_round + 1).count > 0) && tournament.current_round < tournament.max_number_of_rounds
  end


  def match_params
    params.require(:match).permit(:title, :description, :game_id, users:[], user_ids: [])
  end

  def tournament_id_params
    params.require(:tournament).permit(:tournament_id)
  end
end
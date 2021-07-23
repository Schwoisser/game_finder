class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])

    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.append(:comments, partial: "join_tournament_buttons",
    #       locals: { tournament: @tournament, user: current_user })
    #   end
    # end
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
    @tournament = Tournament.find(tournament_id_params[:tournament_id])
    unless @tournament.users.include?(current_user)
      @tournament.users << current_user
      @tournament.save
      render "show"
    end
  end

  def leave
    @tournament = Tournament.find(tournament_id_params[:tournament_id])
    if @tournament.users.include?(current_user)
      @tournament.users.delete current_user
      @tournament.save
      render "show"
    end
  end



  def tournament_params
    params.require(:tournament).permit(:title, :summary, :game, :start_date, :end_date, :country,
      :location, :street, :city, :zip_code, :tournament_type, :armylist_deadline_date, :armylists_visible_date, 
      :payment_type, :payment_deadline_date, :information, :procedure, :max_player_number, 
      :max_number_of_rounds, :game_id, :country_id)
  end

  def tournament_id_params
    params.require(:tournament).permit(:tournament_id)
  end


end
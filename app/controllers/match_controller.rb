class MatchController < ApplicationController
  def index
    @matches = Match.all # where games in user.games
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

  # This will pass with flying colors as long as there's a person key
  # in the parameters, otherwise it'll raise an
  # ActionController::ParameterMissing exception, which will get
  # caught by ActionController::Base and turned into a 400 Bad
  # Request error.
  def update
    # person = Ma6.people.find(params[:id])
    # person.update!(person_params)
    # redirect_to person
  end

  private
  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def match_params
    params.require(:match).permit(:title, :description, :game_id)
  end
end

class MatchScoringsController < ApplicationController

  def show
    @match_scoring = MatchScoring.find(params[:id])
  end

  def update
  end


  def decline_rating
    @user = current_user
    @match_scoring = MatchScoring.find(params[:id])
    @match = @match_scoring.match

    if @match.user_in_match(current_user)
      @match_scoring.rated = true
      @match_scoring.save
    end
  end  


  # def invitation_params
  #   params.require(:match_scoring).permit(:id, :player_attribute_id)
  # end

end
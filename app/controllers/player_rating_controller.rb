class PlayerRatingController < ApplicationController
  
    def create
        return unless current_user

        match_scoring = MatchScoring.find params[:match_scoring_id]
        

        return unless match_scoring.user == current_user
        match_scoring.rated = true
        match_scoring.save

        rated_user = User.find params[:user_id]

        match = Match.find params[:match_id]
        player_attribute = PlayerAttribute.find params[:player_attribute_id]

        begin
            count = PlayerAttributeCount.where(user: rated_user, player_attribute: player_attribute).first
        rescue => e
        end
        
        if count
            count.votes += 1
            count.save
        else
            count = PlayerAttributeCount.new(user: rated_user, player_attribute: player_attribute, votes: 1)
            count.save
        end
        redirect_to "/"
    end

    def set_as_rated
        return unless current_user
        match_scoring = MatchScoring.find params[:match_scoring_id]
        return unless match_scoring.user == current_user
        match_scoring.rated = true
        match_scoring.save
        redirect_to "/"
    end
end
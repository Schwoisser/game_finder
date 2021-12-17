class MainController < ApplicationController
    def index
        @user = current_user
        @tournaments = Tournament.all
        @invited_games = MatchScoring.where(user_id: @user.id, accepted: false)
        @upcoming_games = MatchScoring.where(user_id: @user.id, accepted: true)
    end 

    def elements
    end
end
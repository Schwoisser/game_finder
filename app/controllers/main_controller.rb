class MainController < ApplicationController
    def index
        if params[:locale]
          current_user.locale = params[:locale]
          current_user.save
          I18n.locale = current_user.locale
        end
        @user = current_user
        @tournaments = Tournament.all
        @invited_games = MatchScoring.where(user_id: @user.id, accepted: false)
        @upcoming_games = MatchScoring.where(user_id: @user.id, accepted: true)
        begin
          @users_in_area_number = User.joins(:games).by_distance(:origin => current_user)[1..13].size
        rescue =>e
          @users_in_area_number = 0
        end
        @matches_in_area_number = Match.where(status: "open").by_distance(:origin => current_user)[1..13].try(:size) || 0
        @unrated_matches_temp = MatchScoring.where(user_id: current_user.id, rated: false)
        @unrated_matches = []
        # TODO use join
        @unrated_matches.each |m|
          if m.match.start_date < Date.current
            @unrated_matches << m
          end
        end
        @dev_notes = DevNote.last(2)
    end 

    def elements
    end

    def imprint
    end
    def privacy_policy
    end
end
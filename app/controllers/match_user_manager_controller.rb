class MatchUserManagerController < ApplicationController

  def accept_pending_user
    @user = current_user
    @match_pending_user = MatchPendingUser.find(params[:id])
    @match = @match_pending_user.match
    @user = @match_pending_user.user

    unless @match.user == current_user#
      return
    end
    
    @match_scoring = MatchScoring.create(user: @user, match: @match, accepted: true)

    if @match_scoring
      @match_pending_user.delete
    end
    render "match_user_manager"
  end

  def delete_match_scoring
    @user = current_user
    @match_scoring = MatchScoring.find(params[:id])
    @match = @match_scoring.match

    unless @match.user == current_user
      return
    end
    
    @match_scoring.delete

    render "match_user_manager"
  end

  def invite_user_to_match
    @invited_user = User.find params[:user_id]
    @match = Match.find params[:match_id]

    unless @match.user == current_user
      return
    end
    @match_scoring = MatchScoring.create(user: @invited_user, match: @match, accepted: false)
    @current_users = @match.users.filter {|u| u != current_user}
    @users = User.within(20, :origin => current_user).filter {|u| u != current_user} - @current_users
    render "invite_user_manager"
  end

end
class AbuseReportsController < ApplicationController
  def new
    Rails.logger.info params
    @match = Match.find params[:match_id]
    unless @match.user_in_match current_user
      return
    end

    @abuse_report = AbuseReport.new
    @abuse_report.match = @match
    # @abuse_report.user = current_user

    @users = @match.users.filter{|u| u != current_user}

  end

  def create
    #check user params
    #save report
    @abuse_report = AbuseReport.new(abuse_report_params)
    @abuse_report.user = current_user
    @abuse_report.save
    match_scoring = MatchScoring.where(match: @abuse_report.match, user: current_user).first
    match_scoring.rated = true
    match_scoring.save
    render "created"
  end

  def abuse_report_params
    params.require(:abuse_report).permit(:description, :match_id, :reported_user_id)
  end
end
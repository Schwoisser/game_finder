class BattleReportController < ApplicationController
  def index
  end

  def show
  end


  def new
    @battle_report = BattleReport.new
  end

  def create
    @user = current_user
    battle_report = BattleReport.create(battle_report_params)
    battle_report.user = @user
    battle_report.save
    redirect_to action: "index"
  end

  def edit
  end

  def update
  end

  def delete
  end

  def battle_report_params
    params.require(:battle_report).permit()
  end

end

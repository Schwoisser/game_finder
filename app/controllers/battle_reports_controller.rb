class BattleReportsController < ApplicationController
  def index
    @battle_reports = BattleReport.all
  end

  def show
    @battle_report = BattleReport.find(params[:id])
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
    @battle_report = BattleReport.find(params[:id])
  end

  def update
    @user = current_user
    battle_report = BattleReport.find(params[:id])
    if battle_report.user != current_user
      return
    end
    battle_report = BattleReport.update(battle_report_params)
    battle_report.user = @user
    battle_report.save
    redirect_to action: "index"
  end

  def delete
  end

  def battle_report_params
    params.require(:battle_report).permit(:title, :description)
  end

end

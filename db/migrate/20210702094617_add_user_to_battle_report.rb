class AddUserToBattleReport < ActiveRecord::Migration[6.1]
  def change
    add_reference :battle_reports, :user
  end
end
class CreateBattleReports < ActiveRecord::Migration[6.1]
  def change
    create_table :battle_reports do |t|
      t.timestamps
    end
  end
end

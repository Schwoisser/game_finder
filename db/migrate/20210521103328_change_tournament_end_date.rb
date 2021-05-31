class ChangeTournamentEndDate < ActiveRecord::Migration[6.1]
  def change 
    change_column :tournaments, :end_date, :datetime
  end
end

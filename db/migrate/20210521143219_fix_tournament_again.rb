class FixTournamentAgain < ActiveRecord::Migration[6.1]
  def change
    rename_column :tournaments, :type, :tournament_type
  end
end

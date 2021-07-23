class AddToTournament < ActiveRecord::Migration[6.1]
  def change
    add_column :tournaments, :round_started, :boolean
    add_column :tournaments, :ended, :boolean
    add_column :tournaments, :round_started_at , :datetime
  end
end

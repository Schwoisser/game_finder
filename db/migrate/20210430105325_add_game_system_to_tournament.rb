class AddGameSystemToTournament < ActiveRecord::Migration[6.1]
  def change
    add_column :tournaments, :gamesystem, :text 
  end
end

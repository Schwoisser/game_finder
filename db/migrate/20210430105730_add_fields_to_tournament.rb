class AddFieldsToTournament < ActiveRecord::Migration[6.1]
  def change
    add_column :tournaments, :address, :text
    add_column :tournaments, :special_rules, :text 
    add_column :tournaments, :end_date, :date
    add_column :tournaments, :max_player_number, :int
  end
end

class AddRoundNumbers < ActiveRecord::Migration[6.1]
  def change
    add_column :tournaments, :max_number_of_rounds, :int, default: 3
    add_column :tournaments, :current_round, :int, default: 0
    add_column :matches, :tournament_round, :int, default: nil
    add_column :tournaments, :game_id, :bigint, default: 0
  end
end

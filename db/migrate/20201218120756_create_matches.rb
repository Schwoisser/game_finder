class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.datetime :start_date
      t.text :title
      t.text :description
      t.bigint :game_id
      t.bigint :tournament_id
      t.timestamps
    end
  end
end

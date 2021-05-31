class AddShortTitleToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :short_title, :string
  end
end

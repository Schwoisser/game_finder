class AddCreatorTomatch < ActiveRecord::Migration[6.1]
  def change
    add_reference :matches, :user
    add_column :matches, :status, :string, default: "open"
    add_column :matches, :max_player_number, :integer, default: 2000
  end
end

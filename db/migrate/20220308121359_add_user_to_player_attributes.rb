class AddUserToPlayerAttributes < ActiveRecord::Migration[6.1]
  def change
    add_reference :matches_player_attributes, :user
  end
end

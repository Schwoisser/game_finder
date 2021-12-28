class AddNumberOfVotesToPlayerAttributes < ActiveRecord::Migration[6.1]
  def change
    add_column :player_attributes_users, :votes, :integer, default: 0
  end
end

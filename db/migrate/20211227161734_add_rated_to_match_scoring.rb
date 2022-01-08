class AddRatedToMatchScoring < ActiveRecord::Migration[6.1]
  def change
    add_column :matches_users, :rated, :boolean, default: false
  end
end

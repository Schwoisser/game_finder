class AddScoreToMatchesUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :matches_users, :match_score, :bigint
  end
end

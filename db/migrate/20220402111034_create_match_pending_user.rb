class CreateMatchPendingUser < ActiveRecord::Migration[6.1]
  def change
    create_table :match_pending_users do |t|
      t.bigint "user_id"
      t.bigint "match_id"
      t.timestamps
    end
  end
end

class CreateFriendList < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_lists do |t|      
      t.bigint :inviting_user_id, null: false
      t.bigint :receiving_user_id, null: false
      t.integer :status, default: 0
      t.text :message, default: ""
      t.timestamps
    end
  end
end

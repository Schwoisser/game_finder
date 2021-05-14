class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.text :message
      t.bigint :match_id
      t.bigint :sender_id
      t.bigint :receiver_id


      t.timestamps
    end
  end
end

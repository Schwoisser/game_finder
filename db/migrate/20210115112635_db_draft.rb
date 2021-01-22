class DbDraft < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.datetime :start_date
      t.text :title
      t.text :description
      t.bigint :organizer_id
      t.timestamps
    end

    create_table :messages do |t|
      t.bigint :sender_id
      t.bigint :receiver_id
      t.bigint :tournament_id
      t.bigint :player_group_id
      t.text :message
      t.timestamps
    end

    create_table :armies do |t|
      t.bigint :user_id
      t.bigint :game_id
      t.text :title
      t.text :description
      t.timestamps
    end  

    create_table :player_groups do |t|
      t.bigint :creator_id
      t.text :title
      t.text :description
      t.timestamps
    end  

    create_table :player_attributes do |t|
      t.text :title
      t.text :description
      t.timestamps
    end

  end
end

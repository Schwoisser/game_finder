class DbDraftJoinTables < ActiveRecord::Migration[6.1]
  def change
    create_table :games_users do |t|
      t.bigint :user_id
      t.bigint :game_id
      t.timestamps
    end  

    create_table :matches_users do |t|
      t.bigint :user_id
      t.bigint :match_id
      t.timestamps
    end      

    create_table :tournaments_users do |t|
      t.bigint :user_id
      t.bigint :tournament_id
      t.timestamps
    end      

    create_table :player_groups_users do |t|
      t.bigint :user_id
      t.bigint :player_group_id
      t.timestamps
    end

    create_table :player_attributes_users do |t|
      t.bigint :user_id
      t.bigint :player_attribute_id
      t.timestamps
    end

    create_table :matches_player_attributes do |t|
      t.bigint :match_id
      t.bigint :player_attribute_id
      t.timestamps
    end

  end
end

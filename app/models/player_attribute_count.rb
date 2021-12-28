class PlayerAttributeCount < ApplicationRecord
    self.table_name = "player_attributes_users"
    belongs_to :user
    belongs_to :player_attribute
  end
class MatchScoring < ApplicationRecord
  self.table_name = "matches_users"
  belongs_to :match
  belongs_to :user
end
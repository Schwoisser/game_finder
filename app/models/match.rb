class Match < ApplicationRecord
  belongs_to :game
  belongs_to :tournament, optional: true
  has_and_belongs_to_many :users
  has_many :match_scorings, class_name: "MatchScoring"
end

class Match < ApplicationRecord
  acts_as_mappable :lat_column_name => :latitude, :lng_column_name => :longitude
  belongs_to :game
  belongs_to :tournament, optional: true
  belongs_to :user
  has_and_belongs_to_many :users
  has_many :match_scorings, class_name: "MatchScoring"
  
  def stati
    return ["open", "closed", "finished"]
  end
end

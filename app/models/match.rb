class Match < ApplicationRecord
  acts_as_mappable :lat_column_name => :latitude, :lng_column_name => :longitude
  belongs_to :game
  belongs_to :tournament, optional: true
  belongs_to :user
  has_and_belongs_to_many :users
  has_many :match_scorings, class_name: "MatchScoring"

  validates :start_date, presence: true
  
  def stati
    return ["open", "closed", "finished"]
  end

  def user_in_match(user)
    valid = false

    match_scorings.each do |match_scoring|
      if match_scoring.user == user
        valid = true
      end
    end
    return valid
  end

end

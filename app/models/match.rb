class Match < ApplicationRecord
  belongs_to :game
  belongs_to :tournament, optional: true
end

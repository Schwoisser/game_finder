class Army < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :matches
end
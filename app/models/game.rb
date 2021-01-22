class Game < ApplicationRecord
  has_many :matches
  has_many :armies
  has_and_belongs_to_many :users
end

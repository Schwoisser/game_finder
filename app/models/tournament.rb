class Tournament < ApplicationRecord
  has_many :matches
  has_many :messages
  belongs_to :game
  belongs_to :country
  has_and_belongs_to_many :users
  belongs_to :organizer, class_name: "User"
end
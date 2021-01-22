class Tournament < ApplicationRecord
  has_many :matches
  has_many :messages
  has_and_belongs_to_many :users
  belongs_to :organizer, class_name: "User"

end
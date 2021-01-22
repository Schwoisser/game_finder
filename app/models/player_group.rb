class PlayerGroup < ApplicationRecord
  has_many :users
  has_many :messages
  belongs_to :organizer, class_name: "User"
end
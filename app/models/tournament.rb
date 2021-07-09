class Tournament < ApplicationRecord
  after_update_commit { broadcast_replace_later_to 'join_tournament_buttons' }
  # broadcasts_to ->(tournament) { :tournaments }
  has_many :matches
  has_many :messages
  belongs_to :game
  belongs_to :country
  has_and_belongs_to_many :users
  belongs_to :organizer, class_name: "User"
end
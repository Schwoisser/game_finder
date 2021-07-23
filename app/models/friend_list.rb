class FriendList < ApplicationRecord
  enum status: [ :sent, :declined, :accepted ]
  belongs_to :inviting_user, class_name: "User", foreign_key: "inviting_user_id"
  belongs_to :receiving_user, class_name: "User", foreign_key: "receiving_user_id"
end
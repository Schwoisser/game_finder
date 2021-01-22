class Message < ApplicationRecord
  belongs_to :player_group, optional: true
  belongs_to :tournament, optional: true

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User", optional: true
end
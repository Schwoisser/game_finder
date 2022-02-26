class Message < ApplicationRecord
  belongs_to :player_group, optional: true
  belongs_to :tournament, optional: true

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User", optional: true

  # after_create_commit {broadcast_prepend_to "messages_user_#{sender.id}"}
  # after_update_commit {broadcast_replace_to "messages_user_#{sender.id}"}
  # after_destroy_commit {broadcast_remove_to "messages_user_#{sender.id}"}

  after_create_commit {broadcast_prepend_to "messages_user_#{receiver.id}"}
  after_update_commit {broadcast_replace_to "messages_user_#{receiver.id}"}
  after_destroy_commit {broadcast_remove_to "messages_user_#{receiver.id}"}

end
class MarkAsRead < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :unread, :boolean, default: true
  end
end

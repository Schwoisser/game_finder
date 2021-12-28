class AddInfoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :info, :string, limit: 2000
  end
end

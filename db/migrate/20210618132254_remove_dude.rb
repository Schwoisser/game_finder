class RemoveDude < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :latidude, :float
  end
end

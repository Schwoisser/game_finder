class ChangeArmy < ActiveRecord::Migration[6.1]
  def change
    add_column :armies, :army_faction, :string
    rename_column :armies, :description, :army_list
  end
end

class AddLocaleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :locale, :string, limit: 50
  end
end

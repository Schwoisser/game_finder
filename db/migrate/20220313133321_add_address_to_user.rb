class AddAddressToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :country, :string, limit: 2000
    add_column :users, :city, :string, limit: 2000
    add_column :users, :street, :string, limit: 2000
    add_column :users, :zip, :string, limit: 2000
  end
end

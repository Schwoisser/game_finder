class AddAddressToMatches < ActiveRecord::Migration[6.1]
  def change
    add_column :matches, :country, :string, limit: 2000
    add_column :matches, :city, :string, limit: 2000
    add_column :matches, :street, :string, limit: 2000
    add_column :matches, :zip, :string, limit: 2000
  end
end

class AddGeoLocationToMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :matches, :longitude, :float 
    add_column :matches, :latitude, :float     
  end
end

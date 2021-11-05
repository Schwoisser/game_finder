class AddAcceptedToMatchesUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :matches_users, :accepted, :boolean, default:  false  
  end
end

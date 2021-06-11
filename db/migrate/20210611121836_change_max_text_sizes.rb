class ChangeMaxTextSizes < ActiveRecord::Migration[6.1]
  def change
    change_column :invitations, :message, :string, :limit => 2500

    change_column :matches, :description, :string, :limit => 1200

    change_column :messages, :message, :string, :limit => 2500

    change_column :tournaments, :summary, :string, :limit => 1200

    change_column :tournaments, :location, :string, :limit => 100
    change_column :tournaments, :street, :string, :limit => 60
    change_column :tournaments, :zip_code, :string, :limit => 40
  end
end

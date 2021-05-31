class AddFieldsToTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.text :name
      t.text :short_name
      t.timestamps
    end
    add_column :tournaments, :zip_code, :text
    add_column :tournaments, :country_id, :bigint
    add_column :tournaments, :city, :text
    add_column :tournaments, :type, :text
    add_column :tournaments, :armylist_deadline_date, :datetime
    add_column :tournaments, :armylists_visible_date, :datetime
    add_column :tournaments, :payment_type, :text
    add_column :tournaments, :payment_deadline_date, :datetime
    add_column :tournaments, :information, :text
    add_column :tournaments, :prodedure, :text
    rename_column :tournaments, :address, :location
    rename_column :tournaments, :gamesystem, :street
    rename_column :tournaments, :description, :summary
  end
end
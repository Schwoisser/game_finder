class FixTournaments < ActiveRecord::Migration[6.1]
  def change
    rename_column :tournaments, :prodedure, :procedure
  end
end

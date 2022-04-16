class AddNews < ActiveRecord::Migration[6.1]
  def change
    create_table :dev_notes do |t|
      t.text :title
      t.text :intro
      t.text :text
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end

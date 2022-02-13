class AddLanguages < ActiveRecord::Migration[6.1]
  def change

    create_table :languages do |t|
      t.string :name
      t.timestamps
    end

    create_table :languages_users do |t|
      t.bigint :language_id
      t.bigint :user_id
      t.timestamps
    end  

  end
end

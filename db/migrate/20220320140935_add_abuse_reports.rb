class AddAbuseReports < ActiveRecord::Migration[6.1]
  def change
    create_table :abuse_reports do |t|
      t.text :description
      t.bigint :match_id
      t.bigint :user_id
      t.bigint :reported_user_id
      t.timestamps
    end
  end
end

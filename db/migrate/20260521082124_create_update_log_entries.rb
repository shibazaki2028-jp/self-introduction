class CreateUpdateLogEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :update_log_entries do |t|
      t.date :log_date
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

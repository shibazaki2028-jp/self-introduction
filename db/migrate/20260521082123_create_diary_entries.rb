class CreateDiaryEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :diary_entries do |t|
      t.text :body
      t.date :entry_date
      t.string :image
      t.string :image_alt

      t.timestamps
    end
  end
end

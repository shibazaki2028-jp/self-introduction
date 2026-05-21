class CreateArtistEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :artist_entries do |t|
      t.string :name
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end

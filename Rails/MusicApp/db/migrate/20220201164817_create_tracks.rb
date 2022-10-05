class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.integer :band_id, null: false
      t.integer :album_id, null: false
      t.boolean :bonus, null: false, default: false
      t.text :lyrics

      t.index :band_id
      t.index [:ord, :album_id], unique: true
      t.timestamps
    end
  end
end

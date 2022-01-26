class CreateArtworkShare < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :viewer_id, null: false
      t.integer :artwork_id, null: false
      t.index :viewer_id
      t.index :artwork_id
      t.index [:viewer_id, :artwork_id], unique: true

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :artwork_id, null: false
      t.index :user_id
      t.index :artwork_id
      
      t.timestamps
    end
  end
end

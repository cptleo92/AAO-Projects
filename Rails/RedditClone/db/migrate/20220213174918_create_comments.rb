class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :author_id, null: false
      t.integer :post_id, null: false
      t.integer :parent_comment_id
      t.index :author_id
      t.index :post_id
      t.index [:author_id, :post_id], unique: true
      
      t.timestamps
    end
  end
end

class CreateSubsAndPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title, null: false, unique: true, index: true
      t.text :description, null: false
      t.integer :moderator_id, null: false     

      t.timestamps
    end

    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :sub_id, null: false
      t.integer :author_id, null: false, index: true

      t.timestamps
    end
  end
end

class CreateTagTopicsAndTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_topics do |t|
      t.string :tag, null: false
      t.index :tag, unique: true

      t.timestamps
    end

    create_table :taggings do |t|
      t.integer :tag_id, null: false
      t.integer :url_id, null: false

      t.index :url_id

      t.timestamps
    end
  end
end

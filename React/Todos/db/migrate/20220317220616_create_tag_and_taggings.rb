class CreateTagAndTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :tag do |t|
      t.string :name, null: false
    end

    create_table :taggings do |t| 
      t.integer :tag_id, null: false
      t.integer :todo_id, null: false
      t.index [:tag_id, :todo_id], unique: true
    end
  end
end

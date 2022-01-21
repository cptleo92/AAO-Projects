class AddUniqueIndexToTagging < ActiveRecord::Migration[5.2]
  def change
    add_index :taggings, [:tag_id, :url_id], unique: true
  end
end

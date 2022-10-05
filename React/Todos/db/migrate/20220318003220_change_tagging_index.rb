class ChangeTaggingIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :taggings, name: "index_taggings_on_tag_id_and_todo_id"
  end
end

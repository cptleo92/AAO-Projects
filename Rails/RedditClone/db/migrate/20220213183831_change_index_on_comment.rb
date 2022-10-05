class ChangeIndexOnComment < ActiveRecord::Migration[5.2]
  def change
    remove_index :comments, [:author_id, :post_id]
  end
end

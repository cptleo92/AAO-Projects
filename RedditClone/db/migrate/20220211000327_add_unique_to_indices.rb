class AddUniqueToIndices < ActiveRecord::Migration[5.2]
  def change
    remove_index :subs, :title
    add_index :subs, :title, unique: true

    remove_index :users, :username
    add_index :users, :username, unique: true
  end
end

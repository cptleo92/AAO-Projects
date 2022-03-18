class ChangeTagTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table(:tag, :tags)
  end
end

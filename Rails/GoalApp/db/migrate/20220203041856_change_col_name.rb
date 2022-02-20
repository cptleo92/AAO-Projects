class ChangeColName < ActiveRecord::Migration[5.2]
  def change
    rename_column :goals, :public, :public?
  end
end

class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :answerchoices, :answer_choices
  end
end

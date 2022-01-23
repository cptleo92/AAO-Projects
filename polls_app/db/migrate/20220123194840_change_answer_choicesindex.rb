class ChangeAnswerChoicesindex < ActiveRecord::Migration[5.2]
  def change
    remove_index :answer_choices, :text
    add_index :answer_choices, :text
  end
end

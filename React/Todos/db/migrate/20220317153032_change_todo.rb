class ChangeTodo < ActiveRecord::Migration[5.2]
  def change
    change_column_null :todos, :title, false
    change_column_null :todos, :body, false
    change_column_null :todos, :done, false
  end
end

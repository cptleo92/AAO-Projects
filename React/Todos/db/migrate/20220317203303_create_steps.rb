class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :todo_id, null: false, index: true
      t.boolean :done, null: false, default: false
    end
  end
end

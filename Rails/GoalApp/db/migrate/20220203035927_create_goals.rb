class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.boolean :public, default: true, null: false
      t.integer :user_id, null: false
      t.string :description, null: false

      t.index :user_id
      t.index [:user_id, :description], unique: true
      t.timestamps
    end
  end
end

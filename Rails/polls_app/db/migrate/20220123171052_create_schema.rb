class CreateSchema < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.index :username, unique: true
      t.timestamps
    end

    create_table :polls do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.index :title, unique: true

      t.timestamps
    end

    create_table :questions do |t|
      t.string :text, null: false
      t.integer :poll_id, null: false
      t.index :text, unique: true

      t.timestamps
    end

    create_table :answerchoices do |t|
      t.string :text, null: false
      t.integer :question_id, null: false
      t.index :text, unique: true

      t.timestamps
    end


    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :answer_id, null: false
      t.index [:user_id, :answer_id], unique: true

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :session_token, null: false
      t.string :password, null: false
      t.index :email
      t.index [:email, :session_token], unique: true
      t.timestamps
    end
  end
end

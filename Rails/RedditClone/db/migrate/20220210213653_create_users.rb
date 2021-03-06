class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true, index: true
      t.string :password_hash, null: false
      t.string :session_token

      t.timestamps
    end
  end
end

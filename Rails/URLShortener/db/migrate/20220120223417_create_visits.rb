class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.string :url_id, null: false
      t.string :user_id, null: false

      t.index :url_id 
      t.timestamps
    end
  end
end

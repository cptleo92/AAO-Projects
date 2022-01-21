class UpdateVisits < ActiveRecord::Migration[5.2]
  def change
    change_column :visits, :url_id, 'integer USING CAST(url_id AS integer)', null: false
    change_column :visits, :user_id, 'integer USING CAST(user_id AS integer)', null: false
  end
end

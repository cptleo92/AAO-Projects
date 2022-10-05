class AddSeatingToBench < ActiveRecord::Migration[5.2]
  def change
    add_column :benches, :seating, :integer, default: 1
    change_column_null :benches, :seating, false
  end 
end

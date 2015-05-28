class AddFieldsToCashiers < ActiveRecord::Migration
  def change
    add_column :cashiers, :open_with_value, :decimal
  end
end

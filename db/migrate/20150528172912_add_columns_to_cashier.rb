class AddColumnsToCashier < ActiveRecord::Migration
  def change
    add_column :cashiers, :closed_at, :timestamp
  end
end

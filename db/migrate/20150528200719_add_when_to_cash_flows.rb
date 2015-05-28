class AddWhenToCashFlows < ActiveRecord::Migration
  def change
    add_column :cash_flows, :when, :date, null: false
  end
end

class ChangeColumnDescriptionCashflow < ActiveRecord::Migration
  def change
    change_column :cash_flows, :description, :text, null: false
  end
end

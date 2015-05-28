class RenameTypes < ActiveRecord::Migration
  def change
    remove_column :cash_flows, :type
    add_column :cash_flows, :flow_type, :string, limit: 1, null: false

    remove_column :ledger_accounts, :type
    add_column :ledger_accounts, :account_type, :string, limit: 1, null: false
  end
end

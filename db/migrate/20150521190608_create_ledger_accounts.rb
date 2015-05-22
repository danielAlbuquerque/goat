class CreateLedgerAccounts < ActiveRecord::Migration
  def change
    create_table :ledger_accounts do |t|
      t.boolean :active, null: false, defaut: true, index: true
      t.string :description, null: false, limit: 50
      t.string :type, limit: 1, null: false
    end
  end
end

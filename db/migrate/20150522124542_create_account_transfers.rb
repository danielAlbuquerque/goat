class CreateAccountTransfers < ActiveRecord::Migration
  def change
    create_table :account_transfers do |t|
      t.belongs_to :member, index: true, null: false, foreign_key: true
      t.integer :ledger_account_c_id, null: false
      t.integer :ledger_account_d_id, null: false
      t.decimal :value, null: false, precision: 6, scale: 2
      t.text :reason
      t.timestamps null: false
    end
  end
end

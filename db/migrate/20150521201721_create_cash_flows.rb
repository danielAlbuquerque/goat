class CreateCashFlows < ActiveRecord::Migration
  def change
    create_table :cash_flows do |t|
      t.belongs_to :cashier, index: true, null: false, foreign_key: true
      t.belongs_to :member, index: true, null: false, foreign_key: true
      t.belongs_to :ledger_account, index: true, null: false, foreign_key: true
      t.belongs_to :form_of_payment, index: true, null: false, foreign_key: true
      t.string :type, limit: 1, null: false
      t.decimal :value, null: false
      t.string :description, null: false, limit: 30
      t.text :obs
      t.timestamps null: false
    end
  end
end

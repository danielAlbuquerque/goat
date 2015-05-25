class CreateBillToPays < ActiveRecord::Migration
  def change
    create_table :bill_to_pays do |t|
      t.belongs_to :payment_category, index: true, null: false, foreign_key: true
      t.belongs_to :member, index: true, null: false, foreign_key: true
      t.belongs_to :ledger_account, index: true, null: false, foreign_key: true
      t.string :creditor, limit: 100, null: false
      t.date :emission, null: false
      t.date :maturity, null: false
      t.decimal :value, null: false, precision: 6, scale: 2
      t.date :payment_date
      t.text :obs_bill
      t.text :obs_payment

      t.timestamps null: false
    end
  end
end

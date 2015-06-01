class CreateMemberMonthlyPayments < ActiveRecord::Migration
  def change
    create_table :member_monthly_payments do |t|
      t.string :reference, limit: 6, null: false, index: true
      t.string :processed_by, limit: 100, null: false
      t.decimal :total_to_receive, null: false
      t.decimal :total_received, null: false, default: 0
      t.timestamps :processed_at, null: false, index: true
      t.timestamps :deleted_at

      t.timestamps null: false
    end
  end
end

class AddTotalProcessedToMemberMonthlyPayment < ActiveRecord::Migration
  def change
    add_column :member_monthly_payments, :total_processed, :integer, default: 0
  end
end

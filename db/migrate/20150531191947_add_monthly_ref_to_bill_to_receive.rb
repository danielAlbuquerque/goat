class AddMonthlyRefToBillToReceive < ActiveRecord::Migration
  def change
    add_column :bill_to_receives, :monthly_ref, :string, limit: 6
    add_column :bill_to_pays, :monthly_ref, :string, limit: 6
  end
end

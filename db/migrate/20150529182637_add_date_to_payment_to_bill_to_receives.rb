class AddDateToPaymentToBillToReceives < ActiveRecord::Migration
  def change
    add_column :bill_to_receives, :date_to_payment, :date
  end
end

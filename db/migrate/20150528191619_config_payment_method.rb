class ConfigPaymentMethod < ActiveRecord::Migration
  def change
    change_column(:cash_flows, :form_of_payment_id, :integer, null: true)
  end
end

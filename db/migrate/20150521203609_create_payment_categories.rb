class CreatePaymentCategories < ActiveRecord::Migration
  def change
    create_table :payment_categories do |t|
      t.string :description, null: false, limit: 50
    end
  end
end

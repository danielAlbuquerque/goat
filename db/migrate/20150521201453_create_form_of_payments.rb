class CreateFormOfPayments < ActiveRecord::Migration
  def change
    create_table :form_of_payments do |t|
      t.string :description, null: false, limit: 30
    end
  end
end

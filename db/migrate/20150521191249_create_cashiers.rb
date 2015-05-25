class CreateCashiers < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|
      t.boolean :opened, null: false, default: true
      t.timestamps :opened_in, null: false
      t.timestamps :closed_in
      t.decimal :current_cash, null: false, default: 0, precision: 6, scale: 2
      t.string :description, null: false, limit: 50
      t.text :obs

      t.timestamps null: false
    end
  end
end

class AlterDescriptionForCashier < ActiveRecord::Migration
  def change
    change_column :cashiers, :description, :text, null: false
  end
end

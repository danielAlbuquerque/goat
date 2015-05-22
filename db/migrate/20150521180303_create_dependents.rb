class CreateDependents < ActiveRecord::Migration
  def change
    create_table :dependents do |t|
      t.belongs_to :member, index: true, null: false
      t.string :full_name, null: false, limit: 100
      t.string :relationship, null: false, limit: 1, index: true
      t.string :rg, null: false, limit: 8, unique: true, index: true
      t.string :cpf, limit: 100, unique: true, index: true
      t.date :birth_date, null: false
      t.timestamps null: false
    end
  end
end

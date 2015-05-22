class CreateInactiveReasons < ActiveRecord::Migration
  def change
    create_table :inactive_reasons do |t|
      t.belongs_to :member, index: true, null: false, foreign_key: true
      t.text :reason, null: false
      t.date :when, null: false, index: true
    end
  end
end

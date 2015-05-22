class CreateGlassOfWaters < ActiveRecord::Migration
  def change
    create_table :glass_of_waters do |t|
      t.belongs_to :session, index: true, foreign_key: true
      t.text :members, null: false
      t.date :when, null: false
      t.timestamps null: false
    end
  end
end

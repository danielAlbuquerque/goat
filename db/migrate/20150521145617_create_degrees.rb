class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :description, null: false, limit: 30
    end
  end
end

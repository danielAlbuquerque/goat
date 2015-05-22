class CreatePositionHelds < ActiveRecord::Migration
  def change
    create_table :position_helds do |t|
      t.string :description, null: false, limit: 40
    end
  end
end

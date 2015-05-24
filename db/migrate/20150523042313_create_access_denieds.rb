class CreateAccessDenieds < ActiveRecord::Migration
  def change
    create_table :access_denieds do |t|
      t.belongs_to :member, index: true, foreign_key: true
      t.timestamps :created_at, index: true
      t.string :log, null: false, limit: 30, index: true
    end
  end
end

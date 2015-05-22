class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :session_type, index: true, null: false, foreign_key: true
      t.date :when, null: false, index: true
      t.string :schedule, null: false, limit: 5, index: true
      t.text :minutes, null: false
    end
  end
end

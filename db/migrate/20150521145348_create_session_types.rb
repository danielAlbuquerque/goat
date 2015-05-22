class CreateSessionTypes < ActiveRecord::Migration
  def change
    create_table :session_types do |t|
      t.string :description, null: false, limit: 30
    end
  end
end

class CreateEvolutionGrades < ActiveRecord::Migration
  def change
    create_table :evolution_grades do |t|
      t.belongs_to :member, index: true, null: false, foreign_key: true
      t.integer :old_degree_id, index: true, null: false
      t.integer :new_degree_id, index: true, null: false
      t.date :when, null: false, index: true
      t.text :observation
    end
  end
end

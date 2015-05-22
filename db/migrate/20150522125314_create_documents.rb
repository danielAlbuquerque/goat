class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.belongs_to :member, null: false, index: true, foreign_key: true
      t.belongs_to :document_type, null: false, index: true, foreign_key: true
      t.belongs_to :degree, null: false, index: true, foreign_key: true
      t.string :description, null: false, limit: 200
      t.string :password, null: false, limit: 30
      t.string :file_name, null: false, limit: 200

      t.timestamps null: false
    end
  end
end

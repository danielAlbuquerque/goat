class AddTableMembersSessions < ActiveRecord::Migration
  def change
    create_table :members_sessions, id: false do |t|
      t.belongs_to :member, index: true, foreign_key: true
      t.belongs_to :session, index: true, foreign_key: true
    end
  end
end

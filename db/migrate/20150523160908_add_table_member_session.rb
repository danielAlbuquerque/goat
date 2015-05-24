class AddTableMemberSession < ActiveRecord::Migration
  def change
  	create_table :member_session do |t|
  		t.string :session_id, null: false
  		t.text :data
  		t.timestamps
  	end

  	add_index :member_session, :session_id
  	add_index :member_session, :updated_at
  end
end

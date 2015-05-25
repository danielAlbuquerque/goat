class AddAvatarToMembers < ActiveRecord::Migration
  def change
    add_column :members, :avatar, :string, limit: 100
  end
end

class RemoveColumnsFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :birth_uf
    remove_column :members, :birth_city
  end
end

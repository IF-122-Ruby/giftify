class AddUniqueColumnUserToTableRoles < ActiveRecord::Migration[6.1]
  def up
    remove_index :roles, [:user_id]
    add_index :roles, [:user_id], unique: true
  end

  def down
    remove_index :roles, [:user_id], unique: true
    add_index :roles, [:user_id]
  end
end

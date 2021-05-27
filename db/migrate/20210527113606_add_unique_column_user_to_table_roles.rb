class AddUniqueColumnUserToTableRoles < ActiveRecord::Migration[6.1]
  def change
    remove_index :roles, [:user_id]
    add_index :roles, [:user_id, :organization_id], unique: true
  end
end

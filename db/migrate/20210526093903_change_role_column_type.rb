class ChangeRoleColumnType < ActiveRecord::Migration[6.1]
  # bad decision, but change_column :roles, :role, 'integer USING (role AS integer)'
  # doesn`t work
  def up
    remove_column :roles, :role
    add_column :roles, :role, :integer
  end
  def down 
    remove_column :roles, :role
    add_column :roles, :role, :string
  end
end

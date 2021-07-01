class AddRoleToInvitedUser < ActiveRecord::Migration[6.1]
  def change
    add_column :invites, :recipient_role, :string, null: false, default: 'user'
  end
end

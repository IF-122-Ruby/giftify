class AddIndexToInvites < ActiveRecord::Migration[6.1]
  def change
    add_index :invites, :invite_token, unique: true
  end
end
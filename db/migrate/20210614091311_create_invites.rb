class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.references  :organization
      t.references  :user
      t.string   :recipient_email
      t.string   :invite_token

      t.timestamps
    end
  end
end

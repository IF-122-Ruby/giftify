class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.references :user, null: false
      t.references :organization, null: false
      t.string :role, null: false, default: 'user'

      t.timestamps
    end
  end
end

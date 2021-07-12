class CreateTelegramProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :telegram_profiles do |t|
      t.references :user
      t.string :telegram_id
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :connection_token

      t.timestamps
    end

    add_index :telegram_profiles, :connection_token, unique: true
    add_index :telegram_profiles, :telegram_id, unique: true
  end
end

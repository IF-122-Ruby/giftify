class TokenForUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :token, :string, unique: true
  end
end

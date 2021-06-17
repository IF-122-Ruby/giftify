class CreateMyFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :my_favorites do |t|
      t.references :user

      t.timestamps
    end
  end
end

class CreateMicroposts < ActiveRecord::Migration[6.1]
  def change
    create_table :microposts do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :organization, foreign_key: :organization_id
      t.string :title
      t.text :description
      t.string :image
      t.timestamps
    end
  end
end

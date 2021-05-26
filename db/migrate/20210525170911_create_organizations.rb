class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name, unique: true
      t.references :user, null: false, foreign_key: true
      t.integer :monthly_point, default: 10
      t.string :logo

      t.timestamps
    end
  end
end

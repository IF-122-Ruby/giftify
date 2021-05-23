class CreateOrganisations < ActiveRecord::Migration[6.1]
  def change
    create_table :organisations do |t|
      t.string :name, unique: true
      t.integer :creator_id, null: false
      t.integer :monthly_point
      t.string :logo

      t.timestamps
    end
  end
end

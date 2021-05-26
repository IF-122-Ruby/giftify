class AddDefaultDetailToOrganizations < ActiveRecord::Migration[6.1]
  def change
    change_column :organizations, :monthly_point, :integer, default: 10
  end
end

class ChangeBirthdayToBeDateInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :birthday, :date
  end
end

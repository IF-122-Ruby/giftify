class AddTokenForExistingUsers < ActiveRecord::Migration[6.1]
  def change
    User.where(token: nil).find_in_batches do |users|
      users.each do |user|
        user.send(:generate_token)
        user.save
      end
    end
  end
end

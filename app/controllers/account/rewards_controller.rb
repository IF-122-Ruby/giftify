class Account::RewardsController < Account::AccountsController
  def index
    current_user.transactions.gifts
  end
end

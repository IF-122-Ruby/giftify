class Account::ChartsController < Account::AccountsController
  def index
    @sender_user_transactions = current_organization.users.joins(:sender_transactions)
    @gifted_users = current_organization.users.joins(:my_gifts)
  end
end

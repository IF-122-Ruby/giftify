class Account::Admin::AdminsController < Account::AccountsController
  before_action :require_superadmin
end
class Account::UsersController < Account::AccountsController
  before_action :authorize_user

  def index
    @users = current_organization.users.all
  end

  def show
    @user = current_organization.users.find(params[:id])
    authorize([:account, current_user])
  end

  private

  def authorize_user 
    authorize([:account, current_user])
  end
end

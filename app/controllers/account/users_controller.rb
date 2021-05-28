class Account::UsersController < Account::AccountsController
  before_action :set_organization
  
  def index
    @users = @organization.users.all
    authorize([:account, current_user])
  end

  def show
    @user = User.find(params[:id])
    authorize([:account, current_user])
  end

  private

  def set_organization
    @organization = current_user.organization
  end
end

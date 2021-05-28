class Account::UsersController < Account::AccountsController
  before_action :set_organization
  
  def index
    @users = @organization.users.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def set_organization
    @organization = current_user.organization
  end
end

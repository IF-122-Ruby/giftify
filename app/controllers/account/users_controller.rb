class Account::UsersController < Account::AccountsController
  
  def index
    @users = current_organization.users.all
    authorize([:account, @users])
  end

  def show
    @user = current_organization.users.find(params[:id])
    authorize([:account, @user])
  end
end

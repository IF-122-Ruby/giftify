class Account::UsersController < Account::AccountsController
  def index
    @users = collection.paginate(page: params[:page], per_page: 10)
    authorize([:account, @users])
  end

  def show
    @user = resource
    authorize([:account, @user])
  end

  def edit
    @user = resource
    authorize([:account, @user])
  end

  def update
    @user = resource
    authorize([:account, @user])
    @user.assign_attributes(user_update_params)

    respond_to do |format|
      if @user.save(context: user_role_context)
        format.html { redirect_to account_user_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user = resource
    authorize([:account, @user])

    @user.destroy
    respond_to do |format|
      format.html { redirect_to account_users_path, notice: 'User was successfully destroyed.' }
    end
  end

  def export
    @users = collection
    authorize [:account, @users]
    respond_to do |format|
      format.csv { send_data @users.organization_statistic_csv, filename: "users-#{Date.today}.csv" }
      format.xlsx { headers["Content-Disposition"] = "attachment; filename= users-#{Date.today}.xlsx" }
    end
  end

  private

  def user_role_context
    current_user.role.admin? ? :admin_context : :manager_context
  end

  def collection
    current_organization.users
  end

  def resource
    collection.find(params[:id])
  end

  def user_update_params
    params.require(:user).permit( :first_name,
                                  :last_name,
                                  :email,
                                  :birthday,
                                  :password,
                                  :password_confirmation,
                                  role_attributes: %i[id role])
  end
end

class Admin::UsersController < Admin::BaseController
  def index
    @users = collection
    authorize([:admin, @users])
  end

  def show
    @user = resource
    authorize([:admin, @user])
  end

  def edit
    @user = resource
    authorize([:admin, @user])
  end

  def update
    @user = resource
    authorize([:admin, @user])
    @user.assign_attributes(user_update_params)

    respond_to do |format|
      if @user.save(context: user_role_context)
        format.html { redirect_to admin_user_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user = resource
    authorize([:admin, @user])

    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
    end
  end

  private

  def user_role_context
    current_user.role.superadmin?
  end

  def collection
    User.all
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

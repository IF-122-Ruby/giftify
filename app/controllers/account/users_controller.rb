class Account::UsersController < Account::AccountsController
  before_action :authorize_user
  
  def index
    @users = collection
  end

  def show
    @user = resource
  end

  def edit
    @user = resource
  end

  def update
    @user = resource

    respond_to do |format|
      if @user.update(user_update_params)
        format.html { redirect_to account_user_path, notice: 'User was successfully updated.' }
        format.json { redirect_to [:account, @user], status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user = resource
  
    @user.destroy
    respond_to do |format|
      format.html { redirect_to account_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def authorize_user 
    authorize([:account, current_user])
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

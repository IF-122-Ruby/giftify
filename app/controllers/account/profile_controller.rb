class Account::ProfileController < Account::AccountsController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = 'Profile updated succesfully!'
      redirect_to edit_account_profile_path
    else
      flash.now[:warning] = 'Wrong input data. Profile wasn`t updated'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end

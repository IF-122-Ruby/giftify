class Account::ProfileController < Account::AccountsController
  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'Profile updated succesfully!'
      redirect_to edit_account_profile_path
    else
      flash.now[:warning] = 'Wrong input data. Profile wasn`t updated'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :birthday,
                                 :avatar)
  end
end

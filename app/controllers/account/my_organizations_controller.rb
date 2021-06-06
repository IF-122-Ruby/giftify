class Account::MyOrganizationsController < Account::AccountsController
  def edit
    @organization = current_organization
    authorize([:account, @organization])
  end

  def update
    @organization = current_organization
    authorize([:account, @organization])
    @organization.assign_attributes(organization_params)

    if @organization.save
      flash[:notice] = 'Organization update succesfully!'
      redirect_to account_gifts_path
    else
      flash.now[:warning] = 'Wrong input data. Organization wasn`t updated'
      redirect_to edit_account_my_organization_path
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:monthly_point, :logo)
  end
end

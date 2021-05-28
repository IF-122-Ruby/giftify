class Account::Admin::OrganizationsController < Account::Admin::AdminsController 
  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end
end

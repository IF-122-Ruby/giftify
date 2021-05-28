class Admin::OrganizationsController < Admin::AdminsController 
  def index
    @organizations = Organization.all
    authorize([:admin, @organizations])
  end

  def show
    @organization = Organization.find(params[:id])
    authorize([:admin, @organization])
  end
end

class Superadmin::OrganizationsController < Superadmin::SuperadminsController 
  def index
    @organizations = Organization.all
    authorize([:superadmin, @organizations])
  end

  def show
    @organization = Organization.find(params[:id])
    authorize([:superadmin, @organization])
  end
end

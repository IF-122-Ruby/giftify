class Admin::OrganizationsController < Admin::BaseController
  def index
    @organizations = Organization.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @organization = Organization.find(params[:id])
  end
end

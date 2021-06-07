class Admin::OrganizationsController < Admin::BaseController
  def index
    @time = Time.new
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end
end

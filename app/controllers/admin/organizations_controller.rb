class Admin::OrganizationsController < Admin::BaseController
  def index
    @q = Organization.paginate(page: params[:page], per_page: 10).ransack(params[:q])
    @organizations = @q.result
  end

  def show
    @organization = Organization.find(params[:id])
  end
end

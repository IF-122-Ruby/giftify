class Admin::AdminController < Admin::BaseController

  def index
    @organizations = Organization.all
  end
end

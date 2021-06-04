class Admin::AdminController < Admin::BaseController

  def index
    @time = Time.new
    @organizations = Organization.all
  end
end

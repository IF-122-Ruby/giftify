class AdminController < ActionController::Base
  layout "admin"
  def index
    @organizations = Organization.all
  end
end

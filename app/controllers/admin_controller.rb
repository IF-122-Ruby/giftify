class AdminController < ActionController::Base
  def index
    @users = User.all
    @organizations = Organization.all
  end
end

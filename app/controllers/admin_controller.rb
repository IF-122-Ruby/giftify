class AdminController < ActionController::Base
  def admin
    @users = User.all
    @organizations = Organization.all
  end
end

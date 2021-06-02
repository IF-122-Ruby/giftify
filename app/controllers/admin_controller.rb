class AdminController < ActionController::Base

def admin
  @user = User.all
  @organization = Organization.all
end


end

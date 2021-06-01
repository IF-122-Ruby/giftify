class AdminController < ActionController::Base
def admin
  @organization = Organization.all
end


end

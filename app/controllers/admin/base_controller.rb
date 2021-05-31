class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :require_superadmin

  def require_superadmin
    authorize [:admin, :base]
  end
end
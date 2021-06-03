class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :require_superadmin

  private

  def require_superadmin
    authorize [:admin, :base], :require_superadmin?
  end
end

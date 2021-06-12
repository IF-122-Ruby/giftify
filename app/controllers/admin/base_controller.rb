class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :require_superadmin
  layout "admin"

  private

  def require_superadmin
    authorize [:admin, :base], :require_superadmin?
  end
end

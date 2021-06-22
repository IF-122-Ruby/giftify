class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :require_superadmin
  helper_method :current_organization
  layout "admin"

  private

  def require_superadmin
    authorize [:admin, :base], :require_superadmin?
  end

  def current_organization
    @current_organization ||= current_user.organization
  end
end

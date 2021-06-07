class Admin::BaseController < ApplicationController

  layout "admin"

  private

  def require_superadmin
    authorize [:admin, :base], :require_superadmin?
  end
end

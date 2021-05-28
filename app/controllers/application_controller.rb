class ApplicationController < ActionController::Base
  private

  def require_superadmin
    return if current_user.role.superadmin?

    flash[:alert] = "You don't have permission to this page"
    redirect_to root_path
  end

  def require_admin
    return if current_user.role.admin?

    flash[:alert] = "You don't have permission to this page"
    redirect_to root_path
  end

  def require_superadmin_or_admin
    return if current_user.role.superadmin? || current_user.role.admin? 

    flash[:alert] = "You don't have permission to this page"
    redirect_to root_path
  end

  def require_manager_or_admin
    return if current_user.role.superadmin? || current_user.role.admin?

    flash[:alert] = "You don't have permission to this page"
    redirect_to root_path
  end
end

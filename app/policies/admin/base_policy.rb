class Admin::BasePolicy < Struct.new(:user, :dashboard)
  def require_superadmin?
    user.role.superadmin?
  end
end

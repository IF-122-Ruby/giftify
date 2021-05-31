class Admin::BasePolicy < Struct.new(:user, :superadmin)
  def require_superadmin?
    user.role.superadmin?
  end
end

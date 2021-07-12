class Account::OrganizationPolicy < Struct.new(:user, :admin)
  def edit?
    user.admin? || user.superadmin?
  end

  def update?
    user.admin? || user.superadmin?
  end
end

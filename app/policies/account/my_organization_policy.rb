class Account::MyOrganizationPolicy < Struct.new(:user, :admin)
  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end
end

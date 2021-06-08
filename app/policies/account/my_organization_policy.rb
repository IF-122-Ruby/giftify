class Account::MyOrganizationPolicy < Struct.new(:user, :dashboard)
  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end
end

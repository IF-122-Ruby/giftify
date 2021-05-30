class Superadmin::OrganizationPolicy < ApplicationPolicy
  def index?
    user.role.superadmin?
  end

  def show?
    user.role.superadmin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

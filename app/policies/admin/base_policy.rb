class Admin::BasePolicy < ApplicationPolicy
  def require_superadmin?
    user.role.superadmin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

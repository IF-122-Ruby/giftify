class Account::UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.admin? || user.manager? || user.superadmin?
  end

  def update?
    user.admin? || user.manager? || user.superadmin?
  end

  def destroy?
    user.admin? || user.manager? || user.superadmin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

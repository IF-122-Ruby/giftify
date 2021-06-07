class Account::UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def update?
    user.role.admin? || user.role.manager?
  end

  def destroy?
    user.role.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

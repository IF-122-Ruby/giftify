class Account::UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.admin? || user.manager?
  end

  def update?
    user.admin? || user.manager?
  end

  def destroy?
    user.admin? || user.manager?
  end

  def export?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

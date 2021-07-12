class Account::MicropostPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    user.admin? || user.superadmin?
  end

  def create?
    new?
  end
  
  def update?
    user.admin? || user.superadmin?
  end

  def destroy?
    user.admin? || user.superadmin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

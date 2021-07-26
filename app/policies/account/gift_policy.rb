class Account::GiftPolicy < ApplicationPolicy
  def index?
    user.admin? || user.superadmin?
  end

  def show?
    user.admin? || user.superadmin?
  end

  def new?
    user.admin? || user.superadmin?
  end

  def edit?
    user.admin? || user.superadmin?
  end

  def create?
    new?
  end

  def update?
    edit?
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

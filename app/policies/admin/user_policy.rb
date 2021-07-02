class Admin::UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.superadmin?
  end

  def new?
    user.superadmin?
  end

  def edit?
    user.superadmin?
  end

  def create?
    user.superadmin?
  end

  def update?
    user.superadmin?
  end

  def destroy?
    user.superadmin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

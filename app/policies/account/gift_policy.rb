class Account::GiftPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.role.admin?
  end

  def edit?
    user.role.admin?
  end

  def create?
    user.role.admin?
  end
  
  def update?
    edit?
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
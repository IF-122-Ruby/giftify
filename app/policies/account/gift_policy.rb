class Account::GiftPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def create?
    new?
  end
  
  def update?
    edit?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
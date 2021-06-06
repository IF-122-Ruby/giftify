class Account::GiftPolicy < ApplicationPolicy
  delegate :admin?, to: :user
  
  def index?
    true
  end

  def show?
    true
  end

  def new?
    admin?
  end

  def edit?
    admin?
  end

  def create?
    new?
  end
  
  def update?
    edit?
  end

  def destroy?
    admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
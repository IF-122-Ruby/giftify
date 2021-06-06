class Account::UserPolicy < ApplicationPolicy
  delegate :admin?, :manager?, to: :user

  def index?
    true
  end

  def show?
    admin?
  end

  def update?
    admin? || manager? 
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

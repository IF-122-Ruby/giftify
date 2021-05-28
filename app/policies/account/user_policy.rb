class Account::UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.role.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

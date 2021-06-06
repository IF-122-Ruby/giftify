class Account::OrganizationPolicy < ApplicationPolicy
  delegate :admin?, to: :user

  def edit?
    admin?
  end

  def update?
    admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

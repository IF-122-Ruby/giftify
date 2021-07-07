class Account::CommentPolicy < ApplicationPolicy
  def destroy?
    user.admin?
  end

  class Scope < Scope
    def micropost_resolve
      user.organization.micropost_comments
    end
    def gift_resolve
      user.organization.gift_comments
    end
  end
end

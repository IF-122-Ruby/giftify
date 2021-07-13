class Account::CommentPolicy < ApplicationPolicy
  def destroy?
    user.admin? || user.superadmin?
  end

  class Scope < Scope
    def resolve
      [user.organization.micropost_comments, user.organization.gift_comments].inject(:union)
    end
  end
end

class Account::CommentPolicy < ApplicationPolicy
  def destroy?
    user.admin?
  end

  class Scope < Scope
    def micropost_resolve
      user.organization.comments if gift or micropost
    end
  end
end

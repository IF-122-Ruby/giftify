class Account::CommentPolicy < ApplicationPolicy
  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      user.organization.micropost_comments
    end
  end
end

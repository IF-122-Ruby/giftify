class Account::CommentPolicy < ApplicationPolicy
  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope.joins("INNER JOIN microposts ON microposts.id = comments.commentable_id") \
           .where(microposts: { organization_id: user.organization.id })
    end
  end
end

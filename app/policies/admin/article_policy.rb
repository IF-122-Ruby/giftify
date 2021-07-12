class Admin::ArticlePolicy < ApplicationPolicy
  def edit?
    user.superadmin?
  end

  def update?
    user.superadmin?
  end
end

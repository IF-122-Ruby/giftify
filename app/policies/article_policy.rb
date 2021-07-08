class ArticlePolicy < ApplicationPolicy
  def help?
    true
  end

  def edit?
    user && user.superadmin?
  end

  def update?
    user && user.superadmin?
  end
end

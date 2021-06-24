class Admin::UserPolicy < Admin::BasePolicy
  def index?
    true
  end

  def show?
    require_superadmin?
  end

  def edit?
    require_superadmin?
  end

  def update?
    require_superadmin?
  end

  def destroy?
    require_superadmin?
  end

end

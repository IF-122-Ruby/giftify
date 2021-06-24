module UsersHelper
  def user_links
    if current_user.superadmin?
      admin_users_path
    elsif current_user.admin?
      account_users_path
    end
  end
end

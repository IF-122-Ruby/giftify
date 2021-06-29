module UsersHelper
  def user_links
    if current_user.superadmin?
      admin_users_path
    elsif current_user.admin? || current_user.manager? || current_user.simple?
      account_users_path
    end
  end
end

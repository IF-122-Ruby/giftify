module TransactionHelper
  def user_collection_of_current_organization
    current_organization.users.except(current_user).map { |user| [user.first_name, user.id] }
  end
end

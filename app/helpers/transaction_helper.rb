module TransactionHelper
  def user_collection_of_current_organization
    current_user.colleagues.ordered_by_first_name.map { |user| [user.full_name, user.id] }
  end
end

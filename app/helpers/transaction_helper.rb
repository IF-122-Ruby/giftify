module TransactionHelper
  def user_collection_of_current_organization
    current_user.colleagues.ordered_by_first_name.pluck(:first_name, :id)
  end
end

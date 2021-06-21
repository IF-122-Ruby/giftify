module TransactionHelper
  def user_collection_of_current_organization
    current_organization.users.ordered_by_first_name.where.not(id: current_user.id).pluck(:first_name, :id)
  end
end

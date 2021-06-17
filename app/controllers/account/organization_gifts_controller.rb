class Account::OrganizationGiftsController < Account::AccountsController
  def index
    @gifts = collection.paginate(page: params[:page], per_page: 9)
  end

  def show
    @gift = resource
  end

  private

  def collection
    current_organization.gifts
  end

  def resource
    collection.find(params[:id])
  end
end

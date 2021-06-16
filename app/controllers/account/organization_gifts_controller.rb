class Account::OrganizationGiftsController < Account::GiftsController
  def index
    @organization_gifts = collection.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @organization_gift = collection.find(params[:id])
  end
end

class Account::OrganizationGiftsController < Account::GiftsController
  def index
    super
    @organization_gifts = @gifts.paginate(page: params[:page], per_page: 6)
  end

  def show
    @organization_gift = resource
  end
end

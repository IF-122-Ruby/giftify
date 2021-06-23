class Account::MyGiftsController < Account::AccountsController
  def index
    @my_gifts = collection.paginate(page: params[:page], per_page: 6)
  end

  def show
    @my_gift = resource
  end

  private

  def collection
    current_user.my_gifts.ordered
  end

  def resource
    collection.find(params[:id])
  end
end

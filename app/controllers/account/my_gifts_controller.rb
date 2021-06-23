class Account::MyGiftsController < Account::AccountsController
  def index
    @my_gifts = collection.paginate(page: params[:page], per_page: 6)
  end

  def show
    @my_gift = resource
  end

  private

  def collection
    Gift.my_gifts(current_user.id)
  end

  def resource
    collection.find(params[:id])
  end
end

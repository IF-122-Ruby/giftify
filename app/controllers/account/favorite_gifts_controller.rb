class Account::FavoriteGiftsController < Account::AccountsController
  def index
    @favorites = collection
  end

  def create
    @gift = resource
    collection << @gift
  end

  def destroy
    @gift = resource
    collection.delete(@gift)
  end

  private

  def collection
    current_user.favorite_gifts
  end

  def resource
    current_organization.gifts.find(params[:id])
  end
end

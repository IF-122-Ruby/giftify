class Account::FavoriteGiftsController < Account::AccountsController
  before_action :set_gift, only: [:create, :destroy]

  def index
    @gifts = current_user.favorites
  end
  
  def create
    Favorite.create(gift_id: @gift.id, user_id: current_user.id)
  end

  def destroy
    Favorite.where(gift_id: @gift.id, user_id: current_user.id).first.destroy
  end

  private

    def set_gift
      @gift = resource
    end

    def collection
      current_organization.gifts
    end

    def resource
      collection.find(params[:id])
    end
end

class Account::MyFavoritesController < Account::AccountsController
  def index
    @my_favorites = collection.where(gift_params)
  end

  def create
    @gift = collection.build(gift_params)

    if @gift.save
      flash[:notice] = 'Gift create succesfully!'
      redirect_to account_my_favorites_path
    end
  end

  private

    def gift_params
      params.permit(:user_id, :gift_id)
    end

    def collection
      current_user.my_favorites
    end

    def resource
      collection.find(params[:id])
    end
end

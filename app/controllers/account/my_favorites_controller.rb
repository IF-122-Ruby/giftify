class Account::MyFavoritesController < Account::AccountsController
  def index
    @my_favorites = collection
  end

  private

  def collection
    current_user.my_favorite
  end
end

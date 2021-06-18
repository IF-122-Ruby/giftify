class Account::FavoriteGiftsController < Account::AccountsController
  before_action :set_gift
  def index
  end

  def create
    if Favorite.create(favorited: @gift, user: current_user)
      redirect_to @gift, notice: 'Project has been favorited'
    else
      redirect_to @gift, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @gift.id, user_id: current_user.id).first.destroy
    redirect_to @gift, notice: 'Project is no longer in favorites'
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

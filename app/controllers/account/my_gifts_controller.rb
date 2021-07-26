class Account::MyGiftsController < Account::AccountsController
  REWARD_STATUSES = {
    not_enough_points: 'There are not enough points on your balance',
    no_more_gifts: 'The gifts are over',
    success: 'Gift successfully added'
  }

  def index
    @my_gifts = collection.paginate(page: params[:page], per_page: 6)
  end

  def show
    @my_gift = resource
  end

  def receive
    @gift = current_organization.gifts.find(params[:id])
    @result = current_user.purchase_gift(@gift)
    @status = [:not_enough_points, :no_more_gifts].include?(@result) ? 'error' : 'success'

    @result = REWARD_STATUSES[@result]

    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path, flash: { notice: REWARD_STATUSES[@result] } }
    end
  end

  private

  def collection
    current_user.my_gifts.ordered
  end

  def resource
    collection.find(params[:id])
  end
end

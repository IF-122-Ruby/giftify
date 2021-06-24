class Account::MyGiftsController < Account::AccountsController
  def index
    @my_gifts = collection.paginate(page: params[:page], per_page: 6)
  end

  def show
    @my_gift = resource
  end

  def receive
    @gift = current_organization.gifts.find(params[:id])
    @result = current_user.purchase_gift(@gift)
    respond_to do |format|
      if @result == "Gift successfully added"
        @status = 'success'
        format.html { redirect_back fallback_location: root_path, flash: { notice: 'Gift successfully added' } }
      else
        @status = 'error'
        format.html { redirect_back fallback_location: root_path, flash: { notice: 'There are not enough points on your balance' } }
      end
      format.js
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

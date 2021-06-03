class Account::GiftsController < Account::AccountsController

  def index
    @gifts = current_organization.gifts
  end

  def new
    @gift = current_organization.gifts.new
  end

  def show
    @gift = current_organization.gifts.find(params[:id])
  end

  def create
    @gift = current_organization.gifts.new(gift_params)
    if @gift.save
      flash[:notice] = 'Gift create succesfully!'
      redirect_to account_users_path
    else
      flash[:notice] = 'Something went wrong.'
      redirect_back(fallback_location: account_users_path)
    end
  end
  
  def update
    if @gift.update(gift_params)
      flash[:notice] = 'Gift update succesfully!'
      redirect_to account_users_path
    else
      flash[:notice] = 'Something went wrong.'
      redirect_back(fallback_location: account_users_path)
    end
  end

  def destroy
    @gift = current_organization.gifts.find(params[:id])
    @gift.save
    flash[:notice] = 'Gift create succesfully!'
    redirect_back(fallback_location: account_users_path)
  end
  private
  
  def gift_params
    params.require(:gift).permit(:name, :description, :amount, :gift_type)
  end

  def current_gift
  end
end

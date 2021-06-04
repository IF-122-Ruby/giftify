class Account::GiftsController < Account::AccountsController
  def index
    @gifts = current_gifts
    authorize([:account, @gifts])
  end

  def show
    @gift = current_gifts.find(params[:id])
    authorize([:account, @gift])
  end

  def new
    @gift = current_gifts.new
    authorize([:account, @gift])
  end

  def edit
    @gift = current_gifts.find(params[:id])
    authorize([:account, @gift])
  end

  def create
    @gift = current_gifts.new(gift_params)
    if @gift.save
      flash[:notice] = 'Gift create succesfully!'
      redirect_to account_gifts_path
    else
      flash[:notice] = 'Something went wrong.'
      redirect_to new_account_gift_path
    end
  end
  
  def update
    @gift = current_gifts.find(params[:id])
    if @gift.update(gift_params)
      flash[:notice] = 'Gift update succesfully!'
      redirect_to account_gifts_path
    else
      flash[:notice] = 'Something went wrong.'
      render :new
    end
  end

  def destroy
    @gift = current_gifts.find(params[:id])
    @gift.destroy
    flash[:notice] = 'Gift succesfully deleted!'
    redirect_to account_gifts_path
  end
  
  private
  
  def gift_params
    params.require(:gift).permit(:name, :description, :amount, :gift_type)
  end

  def current_gifts
    current_organization.gifts
  end
end

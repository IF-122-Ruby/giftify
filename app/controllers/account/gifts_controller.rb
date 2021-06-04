class Account::GiftsController < Account::AccountsController
  def index
    @gifts = collection
    authorize([:account, @gifts])
  end

  def show
    @gift = collection.find(params[:id])
    authorize([:account, @gift])
  end

  def new
    @gift = collection.new
    authorize([:account, @gift])
  end

  def edit
    @gift = collection.find(params[:id])
    authorize([:account, @gift])
  end

  def create
    @gift = collection.new(gift_params)
    authorize([:account, @gift])
    if @gift.save
      flash[:notice] = 'Gift create succesfully!'
      redirect_to account_gifts_path
    else
      flash[:notice] = 'Something went wrong.'
      redirect_to new_account_gift_path
    end
  end
  
  def update
    @gift = collection.find(params[:id])
    authorize([:account, @gift])
    if @gift.update(gift_params)
      flash[:notice] = 'Gift update succesfully!'
      redirect_to account_gifts_path
    else
      flash[:notice] = 'Something went wrong.'
      redirect_to edit_account_gift_path
    end
  end

  def destroy
    @gift = collection.find(params[:id])
    authorize([:account, @gift])
    @gift.destroy
    flash[:notice] = 'Gift succesfully deleted!'
    redirect_to account_gifts_path
  end
  
  private
  
  def gift_params
    params.require(:gift).permit(:name, :description, :amount, :gift_type)
  end

  def collection
    current_organization.gifts
  end
end

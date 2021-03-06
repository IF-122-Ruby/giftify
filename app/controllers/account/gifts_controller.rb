class Account::GiftsController < Account::AccountsController
  before_action :add_index_breadcrumb, except: :index

  def index
    @gifts = collection.paginate(page: params[:page], per_page: 10)
    authorize([:account, @gifts])
    add_breadcrumb('Organization Gifts')
  end

  def show
    @gift = resource
    authorize([:account, @gift])
    add_breadcrumb(@gift.id)
  end

  def new
    @gift = collection.new
    authorize([:account, @gift])
    add_breadcrumb('New Gift')
  end

  def edit
    @gift = resource
    authorize([:account, @gift])
    add_breadcrumb('Edit Gift')
  end

  def create
    @gift = collection.new(gift_params)
    authorize([:account, @gift])
    if @gift.save
      flash[:notice] = 'Gift create succesfully!'
      redirect_to account_gifts_path
    else
      flash.now[:warning] = 'Wrong input data. Gift wasn`t created'
      render :new
    end
  end

  def update
    @gift = resource
    authorize([:account, @gift])
    if @gift.update(gift_params)
      flash[:notice] = 'Gift update succesfully!'
      redirect_to account_gifts_path
    else
      flash.now[:warning] = 'Wrong input data. Gift wasn`t updated'
      render :edit
    end
  end

  def destroy
    @gift = resource
    authorize([:account, @gift])
    @gift.destroy
    flash[:notice] = 'Gift succesfully deleted!'
    redirect_to account_gifts_path
  end

  private

  def gift_params
    params.require(:gift).permit(:name, :description, :image, :amount, :price, :gift_type)
  end

  def collection
    current_organization.gifts
  end

  def resource
    collection.find(params[:id])
  end

  def add_index_breadcrumb
    add_breadcrumb('Organization Gifts', account_gifts_path)
  end
end

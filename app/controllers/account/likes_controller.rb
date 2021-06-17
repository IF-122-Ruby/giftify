class Account::LikesController < Account::AccountsController

  def index
    @likes = collection
  end

  def show
  end

  def new
    @like = Like.new
  end

  def create
    gift = resource
    @like = collection.build(gift: gift)
    if @like.save
      flash[:notice] = 'Gift create succesfully!'
      redirect_to account_likes_path
    else
      flash.now[:warning] = 'Wrong input data. Gift wasn`t created'
      render :new
    end
  end

  def destroy
    @like.destroy
    flash[:notice] = 'Gift succesfully deleted!'
    redirect_to account_gifts_path
  end

  private

    def collection
      current_user.my_favorite.likes
    end

    def resource
      current_organization.gifts.find(params[:id])
    end
end

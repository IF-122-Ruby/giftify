class Account::MicropostsController < Account::AccountsController
  def index
    @microposts = collection.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    authorize([:account, @microposts])
    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "microposts.html.slim", formats: [:html]),
                       pagination: render_to_string(partial: "paginate.html.slim") }
      }
    end
  end

  def new
    @micropost = collection.new
    authorize([:account, @micropost])
  end

  def create
    @micropost = collection.new(micropost_params.merge!(author: current_user))
    authorize([:account, @micropost])
    if @micropost.save
      flash[:notice] = 'Micropost create succesfully!'
      redirect_to account_microposts_path
    else
      flash.now[:warning] = 'Wrong input data. Micropost wasn`t created'
      render :new
    end
  end
  
  def update
    @micropost = resource
    authorize([:account, @micropost])
    if @micropost.update(micropost_params)
      flash[:notice] = 'Micropost update succesfully!'
      redirect_to account_microposts_path
    else
      flash.now[:warning] = 'Wrong input data. Micropost wasn`t updated'
      render :edit
    end
  end

  def destroy
    @micropost = resource
    authorize([:account, @micropost])
    @micropost.destroy
    flash[:notice] = 'Micropost succesfully deleted!'
    redirect_to account_microposts_path
  end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:title, :description, :image)
  end

  def collection
    current_organization.microposts
  end

  def resource
    collection.find(params[:id])
  end
end

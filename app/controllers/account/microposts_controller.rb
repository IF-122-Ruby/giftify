class Account::MicropostsController < Account::AccountsController
  def index
    @microposts = collection.includes(:author, :comments).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    authorize([:account, @microposts])
    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: 'microposts',
                                                 formats: [:html],
                                                 locals: { microposts: @microposts }),
                       pagination: render_to_string(partial: 'paginate',
                                                    formats: [:html],
                                                    locals: { microposts: @microposts }) }
      }
    end
  end

  def new
    @micropost = collection.new
    authorize([:account, @micropost])
  end

  def create
    @micropost = collection.build(micropost_params.merge(author: current_user))
    authorize([:account, @micropost])

    respond_to do |format|
      if @micropost.save
        format.js
      else
        format.js { render :micropost_error }
      end
    end
  end

  def edit
    @micropost = resource
  end

  def update
    @micropost = resource
    authorize([:account, @micropost])
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.js
      else
        format.js { render :micropost_error }
      end
    end
  end

  def destroy
    @micropost = resource
    authorize([:account, @micropost])
    @micropost.destroy
    flash[:notice] = 'Micropost successfully deleted!'
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

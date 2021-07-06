class Account::ArticlesController < Account::AccountsController
  before_action :add_index_breadcrumb, except: :index

  def index
    @articles = collection.all
    add_breadcrumb('Articles')
  end

  def new
    @article = Article.new
    add_breadcrumb('New')
  end
  
  def show
    @article = resource
    add_breadcrumb('Show')
  end

  def create
    @article = collection.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to account_articles_path
    else
      flash[:notice] = "Invalid article"
      render :edit
    end
  end

  def edit
    add_breadcrumb('Edit')
    @article = resource
  end

  def update
    @article = resource
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to [:account, @article]
    else
     render :edit
    end
  end

  def destroy
    @article = resource
    @article.destroy
    flash[:notice] = "Article was successfully destroyed."
    redirect_to account_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :category)
  end

  def collection
    current_organization.articles
  end

  def resource
    collection.find(params[:id])
  end

  def add_index_breadcrumb
    add_breadcrumb('Articles', account_articles_path)
  end
end

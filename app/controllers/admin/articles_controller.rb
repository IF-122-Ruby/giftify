class Admin::ArticlesController < Admin::BaseController
  def edit
    @article = Article.find(params[:id])
    authorize [:admin, @article]
  end

  def update
    @article = Article.find(params[:id])
    authorize [:admin, @article]
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to "/#{@article.page_name}"
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

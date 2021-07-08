class ArticlesController < ApplicationController
  
  def help
    @article = Article.first
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to help_path
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

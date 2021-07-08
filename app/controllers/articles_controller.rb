class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update]
  
  def help
    @article = Article.find_by(page_name: "help")
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to help_path
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

class ArticlesController < ApplicationController

  def help
    @article = Article.find_by(page_name: Article::HELP)
  end
end

class PostsController < ApplicationController
  # include Rails::Pagination
  def index
    if params[:category_name]
      @posts = Category.find_by(name: params[:category_name]).posts.paginate(page: params[:page], per_page: 6)
    else
      @posts = Post.all.paginate(page: params[:page], per_page: 6)
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end

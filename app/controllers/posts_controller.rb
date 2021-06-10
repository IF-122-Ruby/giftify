class PostsController < ApplicationController
  # include Rails::Pagination
  def index
    @posts = if params[:category_name]
      Category.find_by(name: params[:category_name]).posts.published
    else
      collection
    end
    @posts = @posts.paginate(page: params[:page], per_page: 6).order(:created_at)
  end

  def show
    @post = resource
  end

  private

  def collection
    Post.published
  end

  def resource
    collection.find(params[:id])
  end
end

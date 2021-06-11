class PostsController < ApplicationController
  def index
    @posts = collection.paginate(page: params[:page], per_page: 6).ordered_by_create
  end

  def show
    @post = resource
  end

  private

  def collection
    if params[:category_name]
      Post.joins(:category).where(category: { name: params[:category_name] }).published
    else
      Post.published
    end
  end

  def resource
    collection.find(params[:id])
  end
end

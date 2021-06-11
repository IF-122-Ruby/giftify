class PostsController < ApplicationController
  def index
    @posts = collection.paginate(page: params[:page], per_page: 6).ordered
  end

  def show
    @post = resource
  end

  private

  def collection
    if params[:category_name]
      Post.joins(:category).by_category_name(params[:category_name]).published
    else
      Post.published
    end
  end

  def resource
    collection.find(params[:id])
  end
end

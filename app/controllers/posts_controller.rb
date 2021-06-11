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
      Post.by_category_name(params[:category_name])  
    else
      Post.all
    end.published
  end

  def resource
    collection.find(params[:id])
  end
end

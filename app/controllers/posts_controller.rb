class PostsController < ApplicationController
  def index
    @posts = if params[:category_name]
      collection.by_category_name(params[:category_name])  
    else
      collection
    end.paginate(page: params[:page], per_page: 6).ordered
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

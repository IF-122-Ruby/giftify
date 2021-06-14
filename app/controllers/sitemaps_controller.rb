class SitemapsController < ApplicationController
  def index
    @posts = Post.all
  end
end

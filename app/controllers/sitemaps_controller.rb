class SitemapsController < ApplicationController
  def index
    if Rails.env.production?
      @url = "http://www.giftify.pp.ua"
    elsif Rails.env.development?
      @url = "http://www.localhost:3000"
    end

    @posts = Post.pluck(:id, :updated_at)

    respond_to do |format|
      format.xml 
    end
  end
end
class Api::V1::MyGiftsController < Api::V1::ApiController
  def index
    @my_gifts = collection

    render json: { my_gifts: @my_gifts }
  end

  def show
    @my_gift = resource

    render json: { my_gift: @my_gift }
  end

  private

  def collection
    User.find_by!(token: bearer_token).my_gifts
  end

  def resource
    collection.find(params[:id])
  end
end

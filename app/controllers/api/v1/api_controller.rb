class Api::V1::ApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error

  private

  def handle_error(e)
    render json: { error: e.to_s }, status: :unauthorized
  end

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers["Authorization"]
    header.gsub(pattern, "") if header && header.match(pattern)
  end
end

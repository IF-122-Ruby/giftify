class Api::V1::ApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error

  private

  def handle_error(e)
    render json: { error: e.to_s }, status: :not_found
  end
end

class Api::V1::UsersController < Api::V1::ApiController
  def show
    @user_balance = User.find_by!(token: request.headers[:token]).balance
    
    render json: { balance: @user_balance }
  end
end

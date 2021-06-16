class Account::TransactionController < Account::AccountsController
  def create
    @transaction = current_user.sender_transactions.build(transaction_params) 
    authorize [:account, :transaction]

    if @transaction.save
      flash[:notice] = 'You successfully sent points!'
      redirect_to account_users_path
    else
      render json: { errors: @transaction.errors.full_messages }, status: 422
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:receiver_id, :receiver_type, :amount)
  end
end
  
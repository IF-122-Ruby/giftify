class Account::TransactionController < Account::AccountsController
  def create
    @transaction = current_user.sender_transactions.build(amount: transaction_params[:amount])
    @transaction.receiver = current_user.colleagues.find(transaction_params[:receiver_id])

    respond_to do |format|
      if @transaction.save(context: :user_to_user)
        format.js
      else
        format.js { render :failed_create }
      end
    end
  end

  def new
    @transaction = Transaction.new
  end

  private

  def transaction_params
    params.require(:transaction).permit(:receiver_id, :amount)
  end
end

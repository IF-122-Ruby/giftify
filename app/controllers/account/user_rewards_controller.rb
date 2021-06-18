class Account::UserRewardsController < Account::AccountsController
  def receive
    gift = current_organization.gifts.find(params[:gift])
    if current_user.balance - gift.price >= 0
      Transaction.create(sender: current_user, receiver: gift, amount: gift.price)
      flash[:success] = 'Reward successfully added'
    else
      flash[:unsuccess] = 'There are not enough points on your balance'
    end
    redirect_back(fallback_location: root_path)
  end
end

class Account::UserRewardsController < Account::AccountsController
  def receive
    gift = current_organization.gifts.find(params[:gift])
    respond_to do |format|
      if @result = current_user.purchase_gift(gift)
        format.html { redirect_back fallback_location: root_path, flash: { notice: 'Gift added' } }
      else
        format.html { redirect_back fallback_location: root_path,  flash: { notice: 'Gift not added' } }
      end
      format.js { @result }
    end
  end
end

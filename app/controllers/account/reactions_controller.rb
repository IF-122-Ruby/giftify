class Account::ReactionsController < Account::AccountsController
  def reacted
    @micropost = current_organization.microposts.find(params[:micropost])
    @reaction = @micropost.add_and_remove_reaction(current_user, params[:reaction])
    respond_to do |format|
      if @reaction
        format.html { redirect_back fallback_location: root_path, flash: { notice: 'reaction added' } }
      else
        format.html { redirect_back fallback_location: root_path, flash: { notice: 'reaction removed' } }
      end
      format.js { @micropost }
    end
  end
end

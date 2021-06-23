class Account::ReactionsController < Account::AccountsController
  def create
    @micropost = micropost_resource
    @reaction = @micropost.reactions.build(user: current_user, reaction: params[:reaction])
    respond_to do |format|
      if @reaction.save
        format.html { redirect_back fallback_location: root_path, flash: { notice: 'reaction added' } }
      else
        format.html { redirect_back fallback_location: root_path, flash: { notice: 'reaction not added' } }
      end
      format.js { render :toggle }
    end
  end

  def destroy
    @micropost = micropost_resource
    @reaction = @micropost.reactions.find_by(user: current_user, reaction: params[:reaction]).delete
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, flash: { notice: 'reaction removed' } }
      format.js { render :toggle }
    end
  end

  private

  def micropost_resource
    current_organization.microposts.find(params[:micropost])
  end
end

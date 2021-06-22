class Account::ReactionsController < Account::AccountsController
  def create
    @micropost = resource
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
    @micropost = resource
    @reaction = @micropost.reactions.find_by(user: current_user, reaction: params[:reaction])
    @reaction.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, flash: { notice: 'reaction removed' } }
      format.js { render :toggle }
    end
  end

  private

  def collection
    current_organization.microposts
  end

  def resource
    collection.find(params[:micropost])
  end
end

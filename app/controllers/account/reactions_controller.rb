class Account::ReactionsController < Account::AccountsController
  def reacted
    @micropost = Micropost.find(params[:micropost])
    @reaction = current_user.reactions.find_by(reactionable: @micropost, reaction: params[:reaction])
    if @reaction
      @reaction.destroy
    else
      @reaction = current_user.reactions.build(reactionable: @micropost, reaction: params[:reaction])
      respond_to do |format|
        if @reaction.save
          format.html { redirect_back fallback_location: root_path, flash: { notice: 'reaction added' } }
          format.js { @micropost }
        else
          format.html { redirect_back fallback_location: root_path, flash: { notice: 'reaction not added' } }
          format.js
        end
      end
    end
    redirect_back(fallback_location: root_path)
  end
end
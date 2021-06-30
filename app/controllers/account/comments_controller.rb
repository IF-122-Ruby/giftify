class Account::CommentsController < Account::AccountsController
  def create
    @micropost = resource
    @comment = @micropost.comments.build(comment_params.merge(user: current_user))
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_back fallback_location: root_path, flash: { notice: 'comment added' } }
      else
        format.js { render :comment_error }
      end
    end
  end

  def destroy
    @comment = policy_scope([:account, Comment]).find(params[:id])
    authorize [:account, @comment]
    @comment.delete
    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: root_path, flash: { notice: 'comment deleted' } }
    end
  end

  private

  def resource
    current_organization.microposts.find(params[:micropost])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

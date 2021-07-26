class Account::CommentsController < Account::AccountsController
  def create
    @commentable = resource
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

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

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end

  def resource
    if params[:gift_id]
      current_organization.gifts.find(params[:gift_id])
    elsif params[:micropost_id]
      current_organization.microposts.find(params[:micropost_id])
    end
  end
end

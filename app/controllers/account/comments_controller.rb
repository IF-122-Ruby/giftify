class Account::CommentsController < Account::AccountsController
  def create
    @micropost = resource
    @comment = @micropost.comments.build(comment_params.merge!(user: current_user))
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_back fallback_location: root_path, flash: { notice: 'comment added' } }
      else
        format.js { render :comment_error }
        # { redirect_back fallback_location: root_path, flash: { notice: 'comment not added' } }
      end
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

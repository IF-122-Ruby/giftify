class Admin::FeedbacksController < Admin::BaseController
  def index
    @feedbacks = Feedback.ordered_by_created_at.paginate(page: params[:page], per_page: 10)
  end

  def show
    @feedback = Feedback.find(params[:id])
    @feedback.mark_as_viewed!
  end
end

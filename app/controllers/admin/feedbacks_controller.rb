class Admin::FeedbacksController < Admin::BaseController
  def index
    @feedback = Feedback.all
  end

  def show
    @feedback = Feedback.find(params[:id])
  end
end
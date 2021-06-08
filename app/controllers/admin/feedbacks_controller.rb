class Admin::FeedbacksController < Admin::BaseController
  after_action :feedback_viewed, only: :show

  def index
    @feedback = Feedback.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def show
    @feedback = Feedback.find(params[:id])
    @feedback.viewed = true
    @feedback.save!
  end

  private
    def feedback_viewed
      @feedback.viewed = true
      @feedback.save!
    end
end
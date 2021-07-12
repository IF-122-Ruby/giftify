class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.create(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to root_path, notice: "#{@feedback.name}, thank you for your feedback. The administration will contact you shourtly." }
        ActionCable.server.broadcast 'feedbacks', message: "New feedback created!"
      else
        render :new
      end
    end
  end

  private 
    def feedback_params
      params.require(:feedback).permit(:name, :email, :reason,
                                       :subject, :message)
    end
end

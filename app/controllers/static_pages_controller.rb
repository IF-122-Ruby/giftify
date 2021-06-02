class StaticPagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  
  def home
  end

  def contact_us
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.create(feedback_params)
    if @feedback.save
      redirect_to :root, notice: "#{@feedback.name}, thank you for your feedback. The administration will contact you shourtly."
    else
      render :contact_us
    end
  end

  private 
    def feedback_params
      params.require(:feedback).permit(:name, :email, :reason,
                                       :subject, :message)
    end
end

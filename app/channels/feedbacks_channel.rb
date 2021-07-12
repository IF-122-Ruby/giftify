class FeedbacksChannel < ApplicationCable::Channel
  def subscribed
    stream_from "feedbacks" 
  end

  def unsubscribed
    stop_all_streams
  end
end
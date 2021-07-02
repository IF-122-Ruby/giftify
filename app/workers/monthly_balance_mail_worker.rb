require 'sidekiq-scheduler'

class MonthlyBalanceMailWorker
  include Sidekiq::Worker

  def perform
    User.find_each do |user|
      UserMonthlyBalanceMailer.balance_email(user).deliver_now
    end
  end

end

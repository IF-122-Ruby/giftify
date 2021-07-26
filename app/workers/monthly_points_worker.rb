require 'sidekiq-scheduler'

class MonthlyPointsWorker
  include Sidekiq::Worker

  def perform
    Organization.eager_load(:users).each do |organization|
      organization_transactions = organization.users.map do |user|
        Transaction.new(amount: organization.monthly_point, receiver_type: 'User',
                        receiver_id: user.id, sender_type: 'Organization', sender_id: organization.id)
      end

      Transaction.import organization_transactions
    end
  end
end

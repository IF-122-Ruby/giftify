class Account::NotificationsController < Account::AccountsController
  def index
    @notifications = collection
  end

  private

  def collection
    current_user.own_notifications
  end
end

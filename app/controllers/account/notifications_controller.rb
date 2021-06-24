class Account::NotificationsController < Account::AccountsController
  def index
    @notifications = collection
  end

  def mark_all_as_read
    collection.update!(read: true)

    redirect_back fallback_location: root_path
  end

  private

  def collection
    current_user.own_notifications
  end
end

class Account::NotificationsController < Account::AccountsController
  protect_from_forgery except: :index
  def index
    @notifications = collection.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def mark_all_as_read
    collection.update_all(read: true)

    redirect_back fallback_location: root_path
  end

  private

  def collection
    current_user.own_notifications.order(created_at: :desc)
  end
end

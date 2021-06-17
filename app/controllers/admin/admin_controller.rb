class Admin::AdminController < Admin::BaseController

  def index
  end

  def search
    if params[:search].blank?
      redirect_to(admin_root_path, notice: "Write search request") and return
    else
      @result_users = User.search(params[:search])
      @result_gifts = Gift.search(params[:search])
    end
  end
end

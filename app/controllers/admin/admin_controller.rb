class Admin::AdminController < Admin::BaseController

  def index
  end

  def search
    if params[:search].blank?
      redirect_to(admin_root_path, flesh: "Input search request") and return
    else
      @results = User.search(params[:search])
    end
  end
end

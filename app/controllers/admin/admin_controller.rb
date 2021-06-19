class Admin::AdminController < Admin::BaseController

  def index
  end

  def search
    if params[:search].blank?
      redirect_to(admin_root_path, notice: "Write search request") and return
    else
      @results = Elasticsearch::Model.search(params[:search].to_s, [User, Gift]).records.to_a
    end
  end
end

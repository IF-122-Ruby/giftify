class Account::SearchController < Account::AccountsController
  def search
    if params[:search].blank?
      redirect_to(root_url, notice: "Write search request") and return
    else
      @results = Elasticsearch::Model.search(params[:search].to_s, [User, Gift]).records.to_a
    end
  end
end

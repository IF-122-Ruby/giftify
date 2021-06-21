class Account::SearchController < Account::AccountsController
  def search
    if params[:search].blank?
      redirect_to(account_gifts_path, notice: "Write search request") and return
    else 
      @results = Elasticsearch::Model.search(params[:search].to_s, [User, Gift]).records.to_a
      if @results.blank?
        redirect_to(account_gifts_path, notice: "Records not found") and return
      end
    end
  end
end

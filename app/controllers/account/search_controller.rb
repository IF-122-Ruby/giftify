class Account::SearchController < Account::AccountsController
  def search
    if params[:search].blank?
      redirect_to(account_gifts_path, notice: "Write search request")
    else 
      @results = Elasticsearch::Model.search({
        "query": {
          "bool": {
            "must": {
              "multi_match": {
                "query": params[:search].to_s,
                "fields": [ "first_name", "last_name", "description", "name" ]
              }
            },
            "filter":
              { "term": { "id": current_user.organization.id}}
          }
        }
      }, [User, Gift]).records.to_a
      if @results.blank?
        redirect_to(account_gifts_path, notice: "Records not found")
      end
    end
  end
end

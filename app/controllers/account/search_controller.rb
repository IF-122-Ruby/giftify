class Account::SearchController < Account::AccountsController
  def search
    @results = Elasticsearch::Model.search({
      "query": {
        "bool": {
          "must": {
            "multi_match": {
              "query": params[:search].to_s,
              "fields": %w[first_name last_name description name]
            }
          },
          "filter":
            { "term": { "organization_id": current_user.organization.id} }
        }
      }
    }, [User, Gift]).per_page(10).page(params[:page]).records
    add_breadcrumb('Search')
  end
end

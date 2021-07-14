class Api::V1::SearchController < Api::V1::ApiController
  def index
    @results = Elasticsearch::Model.search({
      "query": {
        "bool": {
          "must": {
            "multi_match": {
              "query": params[:search].to_s,
              "fields": [ "first_name", "last_name", "description", "name" ]
            }
          }
          # ,
          # "filter":
          #   { "term": { "organization_id": current_user.organization.id} }
        }
      }
    }, [User, Gift]).records
    render json: { results: @results}
  end
end
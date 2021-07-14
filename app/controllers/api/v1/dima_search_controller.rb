class Api::V1::DimaSearchController < Api::V1::ApiController
  def index
    @results = Elasticsearch::Model.search({
      "query": {
        "bool": {
          "must": {
            "multi_match": {
              "query": params[:search].to_s,
              "fields": [ "first_name", "last_name", "name", "description" ],
            }
          },
          "filter":
            { "term": { "organization_id": User.find_by!(token: bearer_token).organization.id} }
        }
      }
    }, [User, Gift]).records
    render json: { result: @results }
  end
end
class Api::V1::SearchController < Api::V1::ApiController
  def index
    @results = Elasticsearch::Model.search({
      "query": {
        "bool": {
          "must": {
            "multi_match": {
              "query": params[:search],
              "fields": [ "first_name", "last_name", "description", "name" ],
              "max_expansions": 50
            }
          },
          "filter":
            { "term": { "organization_id": resource.organization.id} }
        }
      }
    }, [User, Gift]).records

    respond_to do |format|
      format.json
    end
  end

  private

  def resource
    current_user.present? ? current_user : User.find_by!(token: bearer_token)
  end
end

class Api::V1::RomanSearchController < Api::V1::ApiController
  def index
    @results = Elasticsearch::Model.search({
      "query": {
        "bool": {
          "must": {
            "multi_match": {
              "type": "phrase_prefix",
              "query": "*#{params[:query]}*",
              "fields": ["first_name", "last_name", "description", "name"]
            }
          },
          "filter":
            { "term": { "organization_id": resource.organization.id} }
        }
      }
    }).records
      
    render 'index.json.jbuilder'
  end

  def resource
    current_user.present? ? current_user : User.find_by!(token: bearer_token)
  end
end

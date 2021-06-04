require "rails_helper"

RSpec.describe "Render admin layout", :type => :request do

  it "Must render admin layout, get response" do
    get "/admin"
    expect(response).to have_http_status(:success)
    expect(response.body).to include("<h2>Menaging organizations</h2>")
  end
end

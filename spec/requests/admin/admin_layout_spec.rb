require "rails_helper"

RSpec.describe "Render admin layout", :type => :request do
  let(:superadmin) { create(:user, :superadmin) }
  before { sign_in superadmin }

  it "Must render admin layout, get response" do
    get "/admin"
    expect(response).to have_http_status(:success)
  end
end

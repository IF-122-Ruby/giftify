require 'rails_helper'

RSpec.describe Account::ChartsController, type: :request do
  let(:admin) { create(:user, :admin) }
  before { sign_in admin }

  describe 'GET #index' do
    it 'returns divs for charts (points, gifts)' do
      get account_charts_path

      expect(response.body).to match /div id="chart-1"/
      expect(response.body).to match /div id="chart-2"/
    end
  end
end

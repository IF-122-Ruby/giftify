require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET #help" do
    let!(:article) { create(:article, :help_page) }
    
    it "correct page" do
      get help_path
      binding.pry
      expect(response.body).to include("<CENTER> Hello")
    end
  end
end

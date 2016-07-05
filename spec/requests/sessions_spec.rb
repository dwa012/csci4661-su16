require 'rails_helper'

RSpec.describe "Sessions", :type => :request do
  describe "GET /sessions" do
    it "works! (now write some real specs)" do
      get sessions_path
      expect(response.status).to be(200)
    end
  end
end

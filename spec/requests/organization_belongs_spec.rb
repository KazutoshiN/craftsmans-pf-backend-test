require 'rails_helper'

RSpec.describe "OrganizationBelongs", type: :request do
  describe "GET /organization_belongs" do
    it "works! (now write some real specs)" do
      get organization_belongs_path
      expect(response).to have_http_status(200)
    end
  end
end

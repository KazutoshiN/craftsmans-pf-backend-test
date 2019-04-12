require 'rails_helper'
RSpec.describe 'OrganizationRelationshipController', type: :request do
  describe "関連組織取得" do
    before :all do
      @organization1 = create(:organization)
      @organization2 = create(:organization, :other, :with_user)
      @organization3 = create(:organization, :other, :with_user)
      @organization1.add_to_organization!(@organization2)
      @organization1.add_to_organization!(@organization3, 1)
    end

    it "全関連組織取得" do
      get "/api/v1/managed_craftsman/#{@organization1.to_param}"

      managed_craftsmans = JSON.parse(response.body)["data"]["managed_craftsmans"]
      expect(managed_craftsmans.length).to eq(2)
      expect(managed_craftsmans[0]).to include("organization_id" => @organization2.id)
      expect(managed_craftsmans[0]).to include({
        "organization_id" => @organization2.id,
        "organization_name" => @organization2.name,
        "organization_type" => 0,
        "craftsmans" => [{
          "id" => @organization2.users.first.id,
          "name" => @organization2.users.first.last_name,
          "picture_url" => @organization2.users.first.picture_url
        }]
      })
    end

    it "collaborator取得" do
      get "/api/v1/managed_craftsman/#{@organization1.to_param}?type=collaborator"

      managed_craftsmans = JSON.parse(response.body)["data"]["managed_craftsmans"]
      expect(managed_craftsmans.length).to eq(1)
      expect(managed_craftsmans[0]).to include("organization_id" => @organization3.id)
      expect(managed_craftsmans[0]).to include({
        "organization_id" => @organization3.id,
        "organization_name" => @organization3.name,
        "organization_type" => 1,
        "craftsmans" => [{
          "id" => @organization3.users.first.id,
          "name" => @organization3.users.first.last_name,
          "picture_url" => @organization3.users.first.picture_url
        }]
      })
    end
  end
end

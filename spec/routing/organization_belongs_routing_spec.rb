require "rails_helper"

RSpec.describe OrganizationBelongsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/organization_belongs").to route_to("organization_belongs#index")
    end

    it "routes to #show" do
      expect(:get => "/organization_belongs/1").to route_to("organization_belongs#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/organization_belongs").to route_to("organization_belongs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/organization_belongs/1").to route_to("organization_belongs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/organization_belongs/1").to route_to("organization_belongs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/organization_belongs/1").to route_to("organization_belongs#destroy", :id => "1")
    end
  end
end

require 'rails_helper'
RSpec.describe OrganizationsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      organization = create(:organization)
      get :index, params: {}
      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      organization = create(:organization)
      get :show, params: {id: organization.to_param}
      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Organization" do
        new_attributes = attributes_for(:organization, name: "new_organization_name")
        expect {
          post :create, params: {organization: new_attributes}
        }.to change(Organization, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested organization" do
        organization = create(:organization)
        new_attributes = attributes_for(:organization, :update_params)
        put :update, params: {id: organization.to_param, organization: new_attributes}
        organization.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(Organization.last.name).to eq(new_attributes[:name])
        expect(Organization.last.shortname).to eq(new_attributes[:shortname])
        expect(Organization.last.postal_code).to eq(new_attributes[:postal_code])
        expect(Organization.last.address).to eq(new_attributes[:address])
        expect(Organization.last.address_building_name).to eq(new_attributes[:address_building_name])
        expect(Organization.last.logo_url).to eq(new_attributes[:logo_url])
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested organization" do
      organization = create(:organization)
      expect {
        delete :destroy, params: {id: organization.to_param}
      }.to change(Organization, :count).by(-1)
    end
  end

end

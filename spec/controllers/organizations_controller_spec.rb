require 'rails_helper'
RSpec.describe OrganizationsController, type: :controller do
  describe "リレーション" do
    it "user" do
      organization = create(:organization, :with_user)
      expect(organization.users[0].address).to eq('test_address')
    end
  end

  describe "GET #index" do
    it "returns a success response" do
      organization = create(:organization)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      organization = create(:organization)
      get :show, params: {id: organization.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Organization" do
        new_attributes = {organization_name: "new_organization_name"}
        expect {
          post :create, params: {organization: new_attributes}
        }.to change(Organization, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/#{new_attributes[:organization_name]}/)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested organization" do
        organization = create(:organization)
        new_attributes = {organization_name: "update_address"}
        put :update, params: {id: organization.to_param, organization: new_attributes}
        organization.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/#{new_attributes[:organization_name]}/)
        expect(Organization.last.organization_name).to eq(new_attributes[:organization_name])
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

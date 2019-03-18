require 'rails_helper'
RSpec.describe OrganizationBelongsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      organization_belong = create(:organization_belong)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      organization_belong = create(:organization_belong)
      get :show, params: {id: organization_belong.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new OrganizationBelong" do
        new_attributes = attributes_for(:organization_belong)

        expect {
          post :create, params: {organization_belong: new_attributes}
        }.to change(OrganizationBelong, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/#{new_attributes[:organization_belong_name]}/)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested organization_belong" do
        organization_belong = create(:organization_belong)
        new_attributes = {
          user_id: 1,
          organization_id: 1,
          belong_type: "new_belong_name",
        }
        put :update, params: {id: organization_belong.to_param, organization_belong: new_attributes}
        organization_belong.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to(
          match(/#{new_attributes[:user_id]}/) &
          match(/#{new_attributes[:organization_id]}/)&
          match(/#{new_attributes[:belong_type]}/)
        )
        expect(OrganizationBelong.last.user_id).to eq(new_attributes[:user_id])
        expect(OrganizationBelong.last.organization_id).to eq(new_attributes[:organization_id])
        expect(OrganizationBelong.last.belong_type).to eq(new_attributes[:belong_type])
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested organization_belong" do
      organization_belong = create(:organization_belong)
      expect {
        delete :destroy, params: {id: organization_belong.to_param}
      }.to change(OrganizationBelong, :count).by(-1)
    end
  end
end

require 'rails_helper'
RSpec.describe "OrganizationBelongsController", type: :request do
  describe "GET #index" do
    it "returns a success response" do
      organization_belong = create(:organization_belong)
      get '/api/v1/organization_belongs'
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      organization_belong = create(:organization_belong)
      get "/api/v1/organization_belongs/#{organization_belong.to_param}"
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "ユーザー作成" do
        new_attributes = attributes_for(:organization_belong)
        expect {
          post "/api/v1/organization_belongs", params: {organization_belong: new_attributes}
        }.to change(OrganizationBelong, :count).by(1)
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested organization_belong" do
        organization_belong = create(:organization_belong)
        new_attributes = attributes_for(:organization_belong, :update_params)
        put "/api/v1/organization_belongs/#{organization_belong.to_param}", params: {organization_belong: new_attributes}
        organization_belong.reload
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')
        expect(OrganizationBelong.last.employment_pattern_type_id).to eq(new_attributes[:employment_pattern_type_id])
        expect(OrganizationBelong.last.permission_type_id).to eq(new_attributes[:permission_type_id])
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested organization_belong" do
      organization_belong = create(:organization_belong)
      expect {
        delete "/api/v1/organization_belongs/#{organization_belong.to_param}"
      }.to change(OrganizationBelong, :count).by(-1)
      expect(response.status).to eq(200)
    end
  end
end

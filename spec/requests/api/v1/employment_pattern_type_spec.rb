require 'rails_helper'
RSpec.describe "EmploymentPatternTypesController", type: :request do
  describe "GET #index" do
    it "returns a success response" do
      get '/api/v1/employment_pattern_types'
      expect(response.status).to eq(200)
      expect(response.body).to match(/正社員/)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get "/api/v1/employment_pattern_types/1"
      expect(response.status).to eq(200)
      expect(response.body).to match(/正社員/)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "ユーザー作成" do
        new_attributes = attributes_for(:employment_pattern_type)
        expect {
          post "/api/v1/employment_pattern_types", params: {employment_pattern_type: new_attributes}
        }.to change(EmploymentPatternType, :count).by(1)
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested employment_pattern_type" do
        new_attributes = attributes_for(:employment_pattern_type)
        put "/api/v1/employment_pattern_types/1", params: {employment_pattern_type: new_attributes}
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')
        expect(EmploymentPatternType.find(1).name).to eq("test")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested employment_pattern_type" do
      expect {
        delete "/api/v1/employment_pattern_types/1"
      }.to change(EmploymentPatternType, :count).by(-1)
      expect(response.status).to eq(200)
    end
  end
end

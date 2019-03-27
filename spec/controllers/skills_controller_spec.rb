require 'rails_helper'
RSpec.describe SkillsController, type: :controller do

  describe "GET #index" do
    it "returns a success response" do
      skill = create(:skill)
      get :index, params: {}
      expect(response).to be_successful
      expect(response.body).to match(/driver_licence_ordinary/)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      skill = create(:skill)
      get :show, params: {id: skill.to_param}
      expect(response).to be_successful
      expect(response.body).to match(/driver_licence_ordinary/)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Skill" do
        new_attributes = attributes_for(:skill)
        expect {
          post :create, params: {skill: new_attributes}
        }.to change(Skill, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end

    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested skill" do
        skill = create(:skill)
        new_attributes = attributes_for(:skill, :update_skill)
        put :update, params: {id: skill.to_param, skill: new_attributes}
        skill.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(Skill.last.skill_type_id).to eq(new_attributes[:skill_type_id])
        expect(Skill.last.skill_detail_type_id).to eq(new_attributes[:skill_detail_type_id])
        expect(Skill.last.code).to eq(new_attributes[:code])
        expect(Skill.last.name).to eq(new_attributes[:name])
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested skill" do
      skill = create(:skill)
      expect {
        delete :destroy, params: {id: skill.to_param}
      }.to change(Skill, :count).by(-1)
    end
  end

end

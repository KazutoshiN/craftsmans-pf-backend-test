require 'rails_helper'
RSpec.describe "SkillsController", type: :request do
  describe "GET #index" do
    it "returns a success response" do
      skill = create(:skill)
      get '/api/v1/skills'
      expect(response.status).to eq(200)
      expect(response.body).to match(/普通自動車運転免許/)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      skill = create(:skill)
      get "/api/v1/skills/#{skill.to_param}"
      expect(response.status).to eq(200)
      expect(response.body).to match(/普通自動車運転免許/)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "ユーザー作成" do
        new_attributes = attributes_for(:skill)
        expect {
          post "/api/v1/skills", params: {skill: new_attributes}
        }.to change(Skill, :count).by(1)
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested skill" do
        skill = create(:skill)
        new_attributes = attributes_for(:skill, :update_params)
        put "/api/v1/skills/#{skill.to_param}", params: {skill: new_attributes}
        skill.reload
        expect(response.status).to eq(200)
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
        delete "/api/v1/skills/#{skill.to_param}"
      }.to change(Skill, :count).by(-1)
      expect(response.status).to eq(200)
    end
  end
end

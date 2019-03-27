require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      user = create(:user)
      get :index, params: {}
      expect(response).to be_successful
      expect(response.body).to match(/test_address/)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = create(:user)
      get :show, params: {id: user.to_param}
      expect(response).to be_successful
      expect(response.body).to match(/test_address/)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "ユーザー作成" do
        new_attributes = attributes_for(:user)
        expect {
          post :create, params: {user: new_attributes}
        }.to change(User, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested user" do
        user = create(:user)
        new_attributes = attributes_for(:user, :update_params)
        put :update, params: {id: user.to_param, user: new_attributes}
        user.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(User.last.last_name).to eq(new_attributes[:last_name])
        expect(User.last.last_name_kana).to eq(new_attributes[:last_name_kana])
        expect(User.last.first_name).to eq(new_attributes[:first_name])
        expect(User.last.first_name_kana).to eq(new_attributes[:first_name_kana])
        expect(User.last.gender).to eq(new_attributes[:gender])
        expect(User.last.birth_date).to eq(new_attributes[:birth_date].to_date)
        expect(User.last.blood_type_id).to eq(new_attributes[:blood_type_id])
        expect(User.last.address).to eq(new_attributes[:address])
        expect(User.last.address_building_name).to eq(new_attributes[:address_building_name])
        expect(User.last.picture_url).to eq(new_attributes[:picture_url])
        expect(User.last.address_urgent).to eq(new_attributes[:address_urgent])
        expect(User.last.name_urgent).to eq(new_attributes[:name_urgent])
        expect(User.last.phone_urgent).to eq(new_attributes[:phone_urgent])
        expect(User.last.relationship_urgent).to eq(new_attributes[:relationship_urgent])
        expect(User.last.organization_joined_date).to eq(new_attributes[:organization_joined_date])
        expect(User.last.working_yesr_construction).to eq(new_attributes[:working_yesr_construction])
        expect(User.last.working_yesr_current_work).to eq(new_attributes[:working_yesr_current_work])
        expect(User.last.is_receive_employment_agreement).to eq(new_attributes[:is_receive_employment_agreement])
        expect(User.last.employment_pattern_type_id).to eq(new_attributes[:employment_pattern_type_id])
        expect(User.last.has_injury_special_insurance).to eq(new_attributes[:has_injury_special_insurance])
        expect(User.last.health_insurance_type_id).to eq(new_attributes[:health_insurance_type_id])
        expect(User.last.pension_type_id).to eq(new_attributes[:pension_type_id])
        expect(User.last.employment_insurance_type_id).to eq(new_attributes[:employment_insurance_type_id])
        expect(User.last.is_got_safe_education).to eq(new_attributes[:is_got_safe_education])
        expect(User.last.last_date_of_health_check).to eq(new_attributes[:last_date_of_health_check].to_date)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = create(:user)
      expect {
        delete :destroy, params: {id: user.to_param}
      }.to change(User, :count).by(-1)
    end
  end

end

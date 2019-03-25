require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe "リレーション" do
    it "organization" do
      user = create(:user, :with_organization)
      expect(user.organizations[0].organization_name).to eq('test_organization_name')
    end
  end

  describe "GET #index" do
    it "returns a success response" do
      user = create(:user)
      get :index, params: {}
      expect(response).to be_successful
      expect(response.body).to match(/test_address/)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = create(:user)
      get :show, params: {id: user.to_param}
      expect(response).to be_successful
      expect(response.body).to match(/test_address/)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "ユーザー作成" do
        new_attributes = {address: "test_address"}
        expect {
          post :create, params: {user: new_attributes}
        }.to change(User, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/#{new_attributes[:address]}/)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested user" do
        user = create(:user)
        new_attributes = {address: "update_address"}
        put :update, params: {id: user.to_param, user: new_attributes}
        user.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
        expect(response.body).to match(/#{new_attributes[:address]}/)
        expect(User.last.address).to eq(new_attributes[:address])
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

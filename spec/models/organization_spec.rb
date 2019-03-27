require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe "リレーション" do
    it "user" do
      organization = create(:organization, :with_user)
      expect(organization.users[0].address).to eq('test_address')
    end
  end
end

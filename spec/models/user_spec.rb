require 'rails_helper'

RSpec.describe User, type: :model do
  describe "リレーション" do
    it "organization" do
      user = create(:user, :with_organization)
      expect(user.organizations[0].name).to eq('テスト組織')
    end

    it "skill" do
      user = create(:user, :with_user_skill)
      expect(user.skills[0].name).to eq('普通自動車運転免許')
    end

    it "attachment" do
      user = create(:user)
      expect {
        user.attachments.create(filename: 'testfile.jpg', url: 'http://localhost/test')
      }.to change(Attachment, :count).by(1)
      expect(user.attachments.last.filename).to eq('testfile.jpg')
    end

    describe "master" do
      let(:user) { create(:user)}
      
      it "blood_type" do
        expect(user.blood_type.name).to eq('A型')
      end
      it "pension_type" do
        expect(user.pension_type.name).to eq('厚生年金')
      end
      it "health_insurance_type" do
        expect(user.health_insurance_type.name).to eq('市町村国保')
      end
    end
  end

end

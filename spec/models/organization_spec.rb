require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe "リレーション" do
    it "user" do
      organization = create(:organization, :with_user)
      expect(organization.users[0].address).to eq('test_address')
    end

    it "attachment" do
      organization = create(:organization)
      expect {
        organization.attachments.create(filename: 'testfile.jpg', url: 'http://localhost/test')
      }.to change(Attachment, :count).by(1)
      expect(organization.attachments.last.filename).to eq('testfile.jpg')
    end

  end
end

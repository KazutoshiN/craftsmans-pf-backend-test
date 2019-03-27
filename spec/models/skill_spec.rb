require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe "リレーション" do
    it "user" do
      skill = create(:skill, :with_user)
      expect(skill.users[0].last_name).to eq('佐藤')
    end


    describe "master" do
      let(:skill) { create(:skill)}

      it "skill_type" do
        expect(skill.skill_type.name).to eq('資格')
      end

      it "skill_detail_type" do
        expect(skill.skill_detail_type.name).to eq('一般')
      end
    end
  end
end

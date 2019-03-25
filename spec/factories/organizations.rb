FactoryBot.define do
  factory :organization do
    organization_name {"test_organization_name"}

    trait :with_user do
      users {[
        build(:user)
      ]}
    end
  end
end

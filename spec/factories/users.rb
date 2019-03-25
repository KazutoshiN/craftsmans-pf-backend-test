FactoryBot.define do
  factory :user do
    address {"test_address"}

    trait :with_organization do
      organizations {[
        build(:organization)
      ]}
    end
  end
end

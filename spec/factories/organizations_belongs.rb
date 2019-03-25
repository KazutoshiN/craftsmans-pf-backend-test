FactoryBot.define do
  factory :organization_belong do
    belong_type     {"test_belong_name"}

    organization
    user
  end
end

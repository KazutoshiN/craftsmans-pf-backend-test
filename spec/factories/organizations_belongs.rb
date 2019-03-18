FactoryBot.define do
  factory :organization_belong do
    user_id         {0}
    organization_id {0}
    belong_type     {"test_belong_name"}
  end
end

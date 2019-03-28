FactoryBot.define do
  factory :organization_belong do
    employment_pattern_type_id      {2}
    permission_type {1}

    organization
    user
  end
end

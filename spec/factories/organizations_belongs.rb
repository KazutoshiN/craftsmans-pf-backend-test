FactoryBot.define do
  factory :organization_belong do
    employment_pattern_type_id      {2}
    permission_type_id {1}

    organization
    user

    trait :update_params do
      employment_pattern_type_id    {1}
      permission_type_id {2}
    end
  end
end

FactoryBot.define do
  factory :skill do
    skill_type_id         {1}
    skill_detail_type_id  {1}
    code                  {"driver_licence_ordinary"}
    name                  {"普通自動車運転免許"}

    trait :with_user do
      users{[
        build(:user)
      ]}
    end

    trait :update_params do
      skill_type_id         {3}
      skill_detail_type_id  {8}
      code                  {"玉掛（1t未満）"}
      name                  {"slinging_under_1ton"}
    end
  end
end

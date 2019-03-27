FactoryBot.define do
  factory :user do
    last_name                 {"佐藤"}
    last_name_kana            {"さとう"}
    first_name                {"鈴木"}
    first_name_kana           {"すずき"}
    gender                    {"male"}
    birth_date                {"1980/01/01"}
    blood_type_id             {1}
    address                   {"test_address"}
    address_building_name     {"tetete"}
    employment_pattern_type_id{1}
    health_insurance_type_id  {1}
    pension_type_id           {1}

    trait :with_organization do
      organizations {[
        build(:organization)
      ]}
    end

    trait :with_skill do
      skills {[
        build(:skill)
      ]}
    end

    trait :update_params do
      last_name                       {"山田"}
      last_name_kana                  {"やまだ"}
      first_name                      {"田中"}
      first_name_kana                 {"たなか"}
      gender                          {"woman"}
      birth_date                      {"1988/02/02"}
      blood_type_id                   {2}
      address                         {"update_address"}
      address_building_name           {"update"}
      picture_url                     {"http://localhost/test"}
      address_urgent                  {"address_urgent"}
      name_urgent                     {"name_urgent"}
      phone_urgent                    {"phone_urgent"}
      relationship_urgent             {"relationship_urgent"}
      organization_joined_date        {"2008/04/03"}
      working_yesr_construction       {1}
      working_yesr_current_work       {2}
      is_receive_employment_agreement {true}
      employment_pattern_type_id      {2}
      has_injury_special_insurance    {true}
      health_insurance_type_id        {2}
      pension_type_id                 {2}
      employment_insurance_type_id    {2}
      is_got_safe_education           {true}
      last_date_of_health_check       {"2010/01/01"}
    end
  end
end

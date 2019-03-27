FactoryBot.define do
  factory :organization do
    name                  {"テスト組織"}
    shortname             {"TST"}
    postal_code           {"102-0083"}
    address               {"東京都千代田区麹町1-1-1"}
    address_building_name {"テストビル 101"}
    logo_url              {"http://localhost/test"}

    trait :with_user do
      users {[
        build(:user)
      ]}
    end

    trait :update_params do
      name                  {"テスト組織_update"}
      shortname             {"TST_update"}
      postal_code           {"102-0081"}
      address               {"東京都千代田区麹町1-1-1_update"}
      address_building_name {"テストビル 101_update"}
      logo_url              {"http://localhost/test_update"}
    end

  end
end

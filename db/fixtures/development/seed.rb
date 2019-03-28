Organizations.seed(:id,
  {
    :id                    => 1,
    :name                  => "BPM株式会社",
    :shortname             => "BPM",
    :postal_code           => "102-0083",
    :address               => "東京都千代田区麹町4-8-1",
    :address_building_name => "THE MOCK-UP BY PORTALPOINT 101",
    :logo_url              => "",
    :created_at            => "2019/03/11",
    :updated_at            => "2019/03/11"
  },
  {
    :id                    => 2,
    :name                  => "株式会社JM",
    :shortname             => "JM",
    :postal_code           => "102-0083",
    :address               => "東京都千代田区麹町1-1-1",
    :address_building_name => "JMビル",
    :logo_url              => "",
    :created_at            => "2019/03/11",
    :updated_at            => "2019/03/11"
  },
  {
    :id                    => 3,
    :name                  => "テスト組織",
    :shortname             => "TST",
    :postal_code           => "102-0083",
    :address               => "東京都千代田区麹町1-1-1",
    :address_building_name => "テストビル 101",
    :logo_url              => "",
    :created_at            => "2019/03/11",
    :updated_at            => "2019/03/11"
  }
)

OrganizationBelongs.seed(:id,
  {
    :id                 => 1,
    :organization_id    => 1,
    :user_id            => 1,
    :permission_type_id => 1,
    :employment_pattern_type_id      => 1,
    :created_at         => "2019/03/11",
    :updated_at         => "2019/03/11"
  },
  {
    :id                 => 2,
    :organization_id    => 1,
    :user_id            => 2,
    :permission_type_id => 2,
    :employment_pattern_type_id      => 2,
    :created_at         => "2019/03/11",
    :updated_at         => "2019/03/11"
  },
  {
    :id                 => 3,
    :organization_id    => 2,
    :user_id            => 2,
    :permission_type_id => 2,
    :employment_pattern_type_id      => 3,
    :created_at         => "2019/03/11",
    :updated_at         => "2019/03/11"
  }
)

Users.seed(:id,
  {
    :id                              => 1,
    :last_name                       => "齋藤",
    :last_name_kana                  => "さいとう",
    :first_name                      => "晃",
    :first_name_kana                 => "あきら",
    :gender                          => "male",
    :birth_date                      => "1986/05/20",
    :blood_type_id                   => 1,
    :address                         => "東京都千代田区麹町4-8-1",
    :address_building_name           => "THE MOCK-UP BY PORTALPOINT 101",
    :picture_url                     => "https://oizq6dce31.execute-api.ap-northeast-1.amazonaws.com/development/attachments?user_id=0&filename=picture.png&environment=development",
    :address_urgent                  => "東京都千代田区麹町4-8-1",
    :name_urgent                     => "斎藤太郎",
    :phone_urgent                    => "9011111111",
    :relationship_urgent             => "父",
    :organization_joined_date        => "2016/03",
    :working_year_construction       => 10,
    :working_year_current_work       => 5,
    :is_receive_employment_agreement => TRUE,
    :has_injury_special_insurance    => TRUE,
    :health_insurance_type_id        => 1,
    :pension_type_id                 => 1,
    :employment_insurance_type_id    => 1,
    :is_got_safe_education           => TRUE,
    :last_date_of_health_check       => "2019/03/11",
    :created_at                      => "2019/03/11",
    :updated_at                      => "2019/03/11"
  }
)

User_skills.seed(:id,
  {
    :id          => 1,
    :user_id     => 1,
    :skill_id    => 1,
    :acquired_at => "2019/03/15",
    :created_at  => "2019/03/15",
    :updated_at  => "2019/03/15"
  }
)

Attachments.seed(:id,
  {
    :id             => 1,
    :container_id   => 1,
    :container_type => "user",
    :filename       => "sample.jpg",
    :url            => "https://s3-ap-northeast-1.amazonaws.com/zzz-public-test/sample.jpg",
    :created_at     => "2019/03/15",
    :updated_at     => "2019/03/15"
  }
)

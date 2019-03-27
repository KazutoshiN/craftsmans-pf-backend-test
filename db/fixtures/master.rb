BloodType.seed(:id,
  { :id => 1, :code => "a", :name => "A型", :sort_order => 1},
  { :id => 2, :code => "a_rh_minus", :name => "A型 RH-", :sort_order => 2},
  { :id => 3, :code => "b", :name => "B型", :sort_order => 3},
  { :id => 4, :code => "b_rh_minus", :name => "B型 RH-", :sort_order => 4},
  { :id => 5, :code => "o", :name => "O型", :sort_order => 5},
  { :id => 6, :code => "o_rh_minus", :name => "O型 RH-", :sort_order => 6},
  { :id => 7, :code => "ab", :name => "AB型", :sort_order => 7},
  { :id => 8, :code => "ab_rh_minus", :name => "AB型 RH-", :sort_order => 8}
)

EmploymentInsuranceType.seed(:id,
  { :id => 1, :code => "not_applicable", :name => "対象外", :sort_order => 1},
  { :id => 2, :code => "applied", :name => "加入", :sort_order => 2},
  { :id => 3, :code => "not_applied", :name => "未加入", :sort_order => 3}
)

EmploymentPatternType.seed(:id,
  { :id => 1, :code => "regular_employee", :name => "正社員", :sort_order => 1},
  { :id => 2, :code => "self_employee", :name => "個人事業主", :sort_order => 2},
  { :id => 3, :code => "executive", :name => "会社役員", :sort_order => 3},
  { :id => 4, :code => "fixed_term_employmen", :name => "有期契約社員", :sort_order => 4}
)

HealthInsuranceType.seed(:id,
  { :id => 1, :code => "municipality_controlled_national_health_insurance", :name => "市町村国保", :sort_order => 1},
  { :id => 2, :code => "japan_health_insurance_association", :name => "全国健康保険協会", :sort_order => 2},
  { :id => 3, :code => "national_health_insurance_association", :name => "国民健康保険組合", :sort_order => 3}
)

PensionType.seed(:id,
  { :id => 1, :code => "employee_pension", :name => "厚生年金", :sort_order => 1},
  { :id => 2, :code => "national_pension", :name => "国民年金", :sort_order => 2}
)


SkillType.seed(:id,
  { :id => 1, :code => "certificate", :name => "資格", :sort_order => 1},
  { :id => 2, :code => "skill_training", :name => "技能講習", :sort_order => 2},
  { :id => 3, :code => "special_education", :name => "特別教育", :sort_order => 3},
  { :id => 4, :code => "general_skill", :name => "一般スキル", :sort_order => 4}
)

SkillDetailType.seed(:id,
  { :id => 1, :code => "general", :name => "一般", :sort_order => 1},
  { :id => 2, :code => "civil_engineering", :name => "土木", :sort_order => 2},
  { :id => 3, :code => "electricity", :name => "電気", :sort_order => 3},
  { :id => 4, :code => "construction", :name => "建築", :sort_order => 4},
  { :id => 5, :code => "facility", :name => "設備", :sort_order => 5},
  { :id => 6, :code => "fire_engineering", :name => "消防", :sort_order => 6},
  { :id => 7, :code => "safety", :name => "安全", :sort_order => 7},
  { :id => 8, :code => "other", :name => "その他", :sort_order => 8}
)

PermissionType.seed(:id,
  { :id => 1, :code => "general", :name => "一般", :sort_order => 1},
  { :id => 2, :code => "admin", :name => "管理者", :sort_order => 2}
)

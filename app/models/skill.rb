class Skill < ApplicationRecord
  has_many :user_skills
  has_many :users, through: :user_skills

  belongs_to :skill_type, optional: true
  belongs_to :skill_detail_type, optional: true
end

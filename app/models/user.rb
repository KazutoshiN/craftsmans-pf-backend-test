class User < ApplicationRecord
  before_create :generate_token

  has_many :organization_belongs
  has_many :organizations, through: :organization_belongs
  has_many :user_skills
  has_many :skills, through: :user_skills

  belongs_to :blood_type, optional: true
  belongs_to :employment_pattern_type, optional: true
  belongs_to :pension_type, optional: true
  belongs_to :health_insurance_type, optional: true

  def generate_token
    self.id = loop do
      random_token = SecureRandom.uuid
      break random_token unless self.class.exists?(id: random_token)
    end
  end
end

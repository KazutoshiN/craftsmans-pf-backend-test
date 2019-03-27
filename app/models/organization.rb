class Organization < ApplicationRecord
  before_create :generate_token

  has_many :organization_belongs
  has_many :users, through: :organization_belongs

  def generate_token
    self.id = loop do
      random_token = SecureRandom.uuid
      break random_token unless self.class.exists?(id: random_token)
    end
  end
end

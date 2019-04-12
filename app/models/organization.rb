class Organization < ApplicationRecord
  before_create :generate_token

  has_many :organization_belongs
  has_many :users, through: :organization_belongs
  has_many :attachments, as: :container
  has_many :from_organizations, class_name: "OrganizationRelationship", foreign_key: "from_id"
  has_many :to_organizations, class_name: "OrganizationRelationship", foreign_key: "to_id"

  def generate_token
    self.id = loop do
      random_token = SecureRandom.uuid
      break random_token unless self.class.exists?(id: random_token)
    end
  end

  def add_to_organization!(other_organization, type = 0)
    from_organizations.create!(to_id: other_organization.id, organization_relationship_type_id: type ? type : 0)
  end

  def delete_to_organization!(other_organization)
    from_organizations.find_by(to_id: other_organization.id).destroy
  end
end

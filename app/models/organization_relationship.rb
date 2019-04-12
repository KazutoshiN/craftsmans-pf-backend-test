class OrganizationRelationship < ApplicationRecord
  belongs_to :from_organization, class_name: "Organization", optional: true
  belongs_to :to_organization, class_name: "Organization", optional: true
  validates :from_id, presence: true
  validates :to_id, presence: true
end

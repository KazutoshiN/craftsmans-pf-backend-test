class OrganizationBelong < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :organization, optional: true
end

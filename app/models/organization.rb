class Organization < ApplicationRecord
  has_many :organization_belongs
  has_many :users, through: :organization_belongs
end

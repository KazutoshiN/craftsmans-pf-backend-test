class User < ApplicationRecord
  has_many :organization_belongs
  has_many :organizations, through: :organization_belongs
end

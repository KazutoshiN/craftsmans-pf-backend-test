class PensionType < ApplicationRecord
  has_many :user, foreign_key: "code"
end

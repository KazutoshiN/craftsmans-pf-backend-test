class Attachment < ApplicationRecord
  belongs_to :container, polymorphic: true, foreign_type: :container_type, foreign_key: :container_id
end

class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :container_id
      t.string :container_type
      t.string :filename
      t.string :url

      t.timestamps
    end
  end
end

class CreateOrganizationBelongs < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_belongs do |t|

      t.string :user_id
      t.string :organization_id
      t.string :belong_type
      t.string :permission_type
      t.timestamps
    end
  end
end

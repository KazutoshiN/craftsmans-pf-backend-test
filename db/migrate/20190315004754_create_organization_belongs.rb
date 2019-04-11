class CreateOrganizationBelongs < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_belongs do |t|

      t.string :user_id
      t.string :organization_id
      t.bigint :employment_pattern_type_id
      t.bigint :permission_type_id
      t.timestamps
    end
  end
end

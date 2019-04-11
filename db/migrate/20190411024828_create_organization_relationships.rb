class CreateOrganizationRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_relationships do |t|

      t.string :organization_from_id
      t.string :organization_to_id
      t.bigint :organization_relationship_type_id
      t.timestamps
    end
  end
end

class CreateOrganizationRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_relationships do |t|

      t.string :from_id
      t.string :to_id
      t.bigint :organization_relationship_type_id
      t.timestamps null:false
    end

    add_index :organization_relationships, :from_id
    add_index :organization_relationships, :to_id
    add_index :organization_relationships, [:from_id, :to_id], unique: true
  end
end

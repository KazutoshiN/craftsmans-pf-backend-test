class CreateOrganizationRelationshipTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_relationship_types do |t|
      t.string  :code
      t.string  :name
      t.integer :sort_order

      t.timestamps
    end
  end
end

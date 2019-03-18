class CreateOrganizationBelongs < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_belongs do |t|

      t.integer :user_id
      t.integer :organization_id
      t.string :belong_type
      t.timestamps
    end
  end
end

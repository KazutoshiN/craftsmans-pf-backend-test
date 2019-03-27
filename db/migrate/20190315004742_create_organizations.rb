class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations, id: :string do |t|

      t.string :name
      t.string :shortname
      t.string :postal_code
      t.string :address
      t.string :address_building_name
      t.string :logo_url

      t.timestamps
    end
  end
end

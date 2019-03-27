class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :string do |t|

      t.string :address
      t.string :last_name
      t.string :last_name_kana
      t.string :first_name
      t.string :first_name_kana
      t.string :gender
      t.date   :birth_date
      t.integer:blood_type_id
      t.string :address
      t.string :address_building_name
      t.string :picture_url
      t.string :address_urgent
      t.string :name_urgent
      t.string :phone_urgent
      t.string :relationship_urgent
      t.string :organization_joined_date
      t.integer :working_yesr_construction
      t.integer :working_yesr_current_work
      t.boolean :is_receive_employment_agreement
      t.integer :employment_pattern_type_id
      t.boolean :has_injury_special_insurance
      t.integer :health_insurance_type_id
      t.integer :pension_type_id
      t.integer :employment_insurance_type_id
      t.boolean :is_got_safe_education
      t.date :last_date_of_health_check

      t.timestamps
    end
  end
end

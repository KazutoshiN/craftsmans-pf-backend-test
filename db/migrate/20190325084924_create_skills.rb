class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.integer :skill_type_id
      t.integer :skill_detail_type_id
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end

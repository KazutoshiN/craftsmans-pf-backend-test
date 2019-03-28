class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.bigint :skill_type_id
      t.bigint :skill_detail_type_id
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end

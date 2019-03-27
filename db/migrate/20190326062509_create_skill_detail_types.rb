class CreateSkillDetailTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_detail_types do |t|
      t.string  :code
      t.string  :name
      t.integer :sort_order

      t.timestamps
    end
  end
end

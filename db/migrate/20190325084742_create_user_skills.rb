class CreateUserSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :user_skills do |t|
      t.string :user_id
      t.bigint :skill_id
      t.datetime :acuired_at

      t.timestamps
    end
  end
end

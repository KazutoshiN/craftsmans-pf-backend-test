class CreatePensionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pension_types do |t|
      t.string  :code
      t.string  :name
      t.integer :sort_order

      t.timestamps
    end
  end
end

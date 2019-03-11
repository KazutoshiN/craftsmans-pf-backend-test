class CreateStatusChangeEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :status_change_events do |t|
      t.integer :issue_id, null: false
      t.string :project_type
      t.string :project_name
      t.string :property_name
      t.string :client_name
      t.string :status
      t.datetime :status_started_at
      t.datetime :status_completed_at
      t.string :next_status
      t.integer :action_user_id
      t.string :action_user_name
      t.integer :order_price
      t.datetime :project_started_at
      t.datetime :project_completed_at
      t.text :comment
      t.timestamps
    end
  end
end

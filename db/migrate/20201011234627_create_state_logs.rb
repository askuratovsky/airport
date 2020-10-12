class CreateStateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :state_logs do |t|
      t.integer :airplane_id
      t.string :state, null: false

      t.timestamps
    end
    add_index :state_logs, :airplane_id
  end
end

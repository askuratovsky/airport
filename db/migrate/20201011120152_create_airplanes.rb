class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.string :name, null: false
      t.string :state, null: false
      t.timestamps
    end
  end
end

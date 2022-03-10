class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.string :month
      t.integer :progress
      t.integer :evaluation

      t.timestamps
    end
  end
end

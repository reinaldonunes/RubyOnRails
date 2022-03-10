class AddGoalToReadings < ActiveRecord::Migration[7.0]
  def change
    add_reference :readings, :goal, null: false, foreign_key: true
  end
end

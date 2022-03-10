class ChangeDataTypeToProgress < ActiveRecord::Migration[7.0]
  def change
    change_column :readings, :progress, :string
    change_column :readings, :evaluation, :string
  end
end

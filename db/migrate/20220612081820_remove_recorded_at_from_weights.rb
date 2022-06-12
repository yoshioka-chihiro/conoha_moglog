class RemoveRecordedAtFromWeights < ActiveRecord::Migration[6.1]
  def change
    remove_column :weights, :recorded_at, :time
  end
end

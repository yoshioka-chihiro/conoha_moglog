class RemoveRecordedAtFromMeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :recorded_at, :time
  end
end

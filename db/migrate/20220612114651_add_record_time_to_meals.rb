class AddRecordTimeToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :record_time, :datetime
  end
end

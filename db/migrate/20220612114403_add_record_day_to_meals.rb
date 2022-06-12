class AddRecordDayToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :record_day, :date
  end
end

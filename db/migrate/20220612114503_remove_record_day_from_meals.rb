class RemoveRecordDayFromMeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :record_day, :date
  end
end

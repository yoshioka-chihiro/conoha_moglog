class RemoveEatTimeFromMeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :eat_time, :date
  end
end

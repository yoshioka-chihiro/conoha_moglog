class AddEatTimeToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :eat_time, :date
  end
end

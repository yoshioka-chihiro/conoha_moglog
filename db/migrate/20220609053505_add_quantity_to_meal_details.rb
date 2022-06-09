class AddQuantityToMealDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :meal_details, :quantity, :integer
  end
end

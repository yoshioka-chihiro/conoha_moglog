class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.integer :end_user_id
      t.integer :meal_type, null: false, default: "0"
      t.time :recorded_at

      t.timestamps
    end
  end
end

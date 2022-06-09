class MealDetail < ApplicationRecord
  belongs_to :meal
  belongs_to :food
  with_options presence: true do
    validates :food_id
    validates :quantity
  end
end

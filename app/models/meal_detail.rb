class MealDetail < ApplicationRecord
  belongs_to :meal
  belongs_to :food
  validates :quantity, presence: true
  validates :food_id, presence: true


end

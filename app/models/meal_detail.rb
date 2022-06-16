class MealDetail < ApplicationRecord
  belongs_to :meal
  belongs_to :food
  validates :quantity, presence: true
  validates :food_id, presence: true
  
  # accepts_nested_attributes_for :album_tracks, reject_if: :all_blank, allow_destroy: true
  
  def calorie_subtotal
    food.calorie * quantity
  end
  
  def protein_subtotal
    food.protein * quantity
  end
  
  def carbohydrate_subtotal
    food.carbohydrate * quantity
  end
  
  def fat_subtotal
    food.carbohydrate * quantity
  end
  
  def fiber_subtotal
    food.carbohydrate * quantity
  end

end

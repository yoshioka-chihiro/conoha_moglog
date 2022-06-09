class Public::MealDetailsController < ApplicationController
  def show
  end
  
  def create
    
  end
  
  private
  
  def meal_detail_params
    permit.require(:meal_detail).permit(:food_id, :meal_id, :quantity)
  end
end

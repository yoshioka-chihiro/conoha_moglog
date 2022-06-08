class Meal < ApplicationRecord
  belongs_to :end_user
  has_many :healths,  dependent: :destroy
  has_many :conditions, through: :healths
  has_many :meal_details,  dependent: :destroy
  has_many :foods, through: :meal_details

  enum meal_type: { breakfast: 0, lunch: 1, dinner: 2, nash:3 }
end

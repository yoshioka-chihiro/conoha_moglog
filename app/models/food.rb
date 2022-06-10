class Food < ApplicationRecord
  has_many :meal_details, dependent: :destroy
  has_many :meals, through: :meal_details
  has_one_attached :image


end

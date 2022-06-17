class Food < ApplicationRecord
  has_many :meal_details, dependent: :destroy
  has_many :meals, through: :meal_details
  has_one_attached :image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  varidates :calorie, presence: true
  varidates :protein, presence: true
  varidates :carbohydrate, presence: true
  varidates :fat, presence: true
  varidates :fiber, presence: true

end

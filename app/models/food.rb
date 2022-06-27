class Food < ApplicationRecord
  has_many :meal_details, dependent: :destroy
  has_many :meals, through: :meal_details

  validates :name, uniqueness: true
  validates :introduction, length: { maximum: 500 }
  validates :calorie, presence: true
  validates :protein, presence: true
  validates :carbohydrate, presence: true
  validates :fat, presence: true
  validates :fiber, presence: true

end

class Food < ApplicationRecord
  has_many :meal_details, dependent: :destroy
  has_many :meals, through: :meal_details
  has_one_attached :image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  validates :calorie, presence: true
  validates :protein, presence: true
  validates :carbohydrate, presence: true
  validates :fat, presence: true
  validates :fiber, presence: true

end

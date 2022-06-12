class Meal < ApplicationRecord
  belongs_to :end_user
  has_many :healths,  dependent: :destroy
  has_many :conditions, through: :healths
  has_many :meal_details,  dependent: :destroy
  has_many :foods, through: :meal_details
  #関連付けしたモデルを一緒にデータ保存できるようにする
  accepts_nested_attributes_for :meal_details, reject_if: :all_blank, allow_destroy: true
  validates :meal_type, presence: true
  validates :record_time, presence: true

  enum meal_type: { breakfast: 0, lunch: 1, dinner: 2, nash:3 }

  def sub_total
    food.calorie * meal_detail.quantity
  end

end
